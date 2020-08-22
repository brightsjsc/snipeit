@extends('layouts/default')

{{-- Page title --}}
@section('title')

 {{ $component->name }}
 {{ trans('general.component') }}
@parent
@stop

{{-- Right header --}}
@section('header_right')
  @can('manage', $component)
    <div class="dropdown pull-right">
      <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        {{ trans('button.actions') }}
          <span class="caret"></span>
      </button>
      <ul class="dropdown-menu pull-right" role="menu22">
        @if ($component->assigned_to != '')
          @can('checkin', $component)
          <li role="menuitem">
            <a href="{{ route('checkin/component', $component->id) }}">
              {{ trans('admin/components/general.checkin') }}
            </a>
          </li>
          @endcan
        @else
          @can('checkout', $component)
          <li role="menuitem">
            <a href="{{ route('checkout/component', $component->id)  }}">
              {{ trans('admin/components/general.checkout') }}
            </a>
          </li>
          @endcan
        @endif

        @can('update', $component)
        <li role="menuitem">
          <a href="{{ route('components.edit', $component->id) }}">
            {{ trans('admin/components/general.edit') }}
          </a>
        </li>
        @endcan
      </ul>
    </div>
  @endcan
@stop


{{-- Page content --}}
@section('content')
<div class="row">
  <div class="col-md-12">




    <!-- Custom Tabs -->
    <div class="nav-tabs-custom">
      <ul class="nav nav-tabs hidden-print">
        <li class="active">
          <a href="#details" data-toggle="tab">
            <span class="hidden-lg hidden-md">
              <i class="fa fa-info-circle" aria-hidden="true"></i>
            </span>
            <span class="hidden-xs hidden-sm">
              {{ trans('general.details') }}
            </span>
          </a>
        </li>
        <li>
          <a href="#files" data-toggle="tab">
            <span class="hidden-lg hidden-md">
              <i class="fa fa-files-o" aria-hidden="true"></i>
            </span>
            <span class="hidden-xs hidden-sm">
              {{ trans('general.files') }}
            </span>
          </a>
        </li>
        <li class="pull-right">
          <a href="#" data-toggle="modal" data-target="#uploadFileModal">
            <i class="fa fa-paperclip" aria-hidden="true"></i>
            {{ trans('button.upload') }}
          </a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="details">
          <div class="row">
            <div class="col-md-9">
              <div class="box box-default">
                <div class="box-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="table table-responsive">

                        <table
                                data-cookie-id-table="componentsCheckedoutTable"
                                data-pagination="true"
                                data-id-table="componentsCheckedoutTable"
                                data-search="true"
                                data-side-pagination="server"
                                data-show-columns="true"
                                data-show-export="true"
                                data-show-footer="true"
                                data-show-refresh="true"
                                data-sort-order="asc"
                                data-sort-name="name"
                                id="componentsCheckedoutTable"
                                class="table table-striped snipe-table"
                                data-url="{{ route('api.components.assets', $component->id)}}"
                                data-export-options='{
                          "fileName": "export-components-{{ str_slug($component->name) }}-checkedout-{{ date('Y-m-d') }}",
                          "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                          }'>
                          <thead>
                          <tr>
                            <th data-searchable="false" data-sortable="false" data-field="name" data-formatter="hardwareLinkFormatter">
                              {{ trans('general.asset') }}
                            </th>
                            <th data-searchable="false" data-sortable="false" data-field="qty">
                              {{ trans('general.qty') }}
                            </th>
                            <th data-searchable="false" data-sortable="false" data-field="created_at" data-formatter="dateDisplayFormatter">
                              {{ trans('general.date') }}
                            </th>
                            <th data-switchable="false" data-searchable="false" data-sortable="false" data-field="checkincheckout" data-formatter="componentsInOutFormatter">
                              {{ trans('general.checkin') }}/{{ trans('general.checkout') }}
                            </th>
                          </tr>
                          </thead>
                        </table>

                      </div>
                    </div> <!-- .col-md-12-->
                  </div>
                </div>
              </div>
            </div> <!-- .col-md-9-->


            <!-- side address column -->
            <div class="col-md-3">
              @if ($component->image!='')
                <div class="col-md-12 text-center" style="padding-bottom: 15px;">
                  <a href="{{ app('components_upload_url') }}{{ $component->image }}" data-toggle="lightbox"><img src="{{ app('components_upload_url') }}{{ $component->image }}" class="img-responsive img-thumbnail" alt="{{ $component->name }}"></a>
                </div>

              @endif

              @if ($component->serial!='')
              <div class="col-md-12" style="padding-bottom: 5px;"><strong>{{ trans('admin/hardware/form.serial') }}: </strong>
              {{ $component->serial }} </div>
              @endif

              @if ($component->purchase_date)
              <div class="col-md-12" style="padding-bottom: 5px;"><strong>{{ trans('admin/components/general.date') }}: </strong>
              {{ $component->purchase_date }} </div>
              @endif

              @if ($component->purchase_cost)
              <div class="col-md-12" style="padding-bottom: 5px;"><strong>{{ trans('admin/components/general.cost') }}:</strong>
              {{ $snipeSettings->default_currency }}

              {{ \App\Helpers\Helper::formatCurrencyOutput($component->purchase_cost) }} </div>
              @endif

              @if ($component->order_number)
              <div class="col-md-12" style="padding-bottom: 5px;"><strong>{{ trans('general.order_number') }}:</strong>
              {{ $component->order_number }} </div>
              @endif
            </div>
          </div> <!-- .row-->
        </div><!-- /.tab-pane asset details -->

        <div class="tab-pane" id="files" style="width:100%">
          <div class="row">
            <div class="col-md-12">
            @if (count($file_upload) > 0)
              <table
                      class="table table-striped snipe-table"
                      id="assetFileHistory"
                      data-pagination="true"
                      data-id-table="assetFileHistory"
                      data-search="true"
                      data-side-pagination="client"
                      data-show-columns="true"
                      data-show-refresh="true"
                      data-sort-order="desc"
                      data-sort-name="created_at"
                      data-show-export="true"
                      data-cookie-id-table="assetFileHistory">
                <thead>
                  <tr>
                    <th data-visible="true" data-field="icon"><span class="sr-only">Icon</span></th>
                    <th class="col-md-2" data-searchable="true" data-visible="true" data-field="notes">{{ trans('general.notes') }}</th>
                    <th class="col-md-2" data-searchable="true" data-visible="true" data-field="image">{{ trans('general.image') }}</th>
                    <th class="col-md-2" data-searchable="true" data-visible="true" data-field="filename">{{ trans('general.file_name') }}</th>
                    <th class="col-md-2" data-searchable="true" data-visible="true" data-field="download">{{ trans('general.download') }}</th>
                    <th class="col-md-2" data-searchable="true" data-visible="true" data-field="created_at">{{ trans('general.created_at') }}</th>
                    <th class="col-md-1" data-searchable="true" data-visible="true" data-field="actions">{{ trans('table.actions') }}</th>
                  </tr>
                </thead>
                <tbody>

                    @foreach ($file_upload as $file)
                      <tr>
                        <td><i class="{{ \App\Helpers\Helper::filetype_icon($file->filename) }} icon-med" aria-hidden="true"></i></td>
                        <td>
                          @if ($file->note)
                          {{ $file->note }}
                          @endif
                        </td>
                        <td>
                         <a href="{{ route('show/componentfile', ['componentId' => $component->id, 'fileId' =>$file->id]) }}" data-toggle="lightbox" data-type="image" data-title="{{ $file->filename }}" data-footer="{{ \App\Helpers\Helper::getFormattedDateObject($component->last_checkout, 'datetime', false) }}">
                            <img src="{{ route('show/componentfile', ['componentId' => $component->id, 'fileId' =>$file->id]) }}" style="max-width: 50px;">
                          </a>
                        </td>
                        <td>
                          {{ $file->filename }}
                        </td>
                        <td>
                          @if ($file->filename)
                          <a href="{{ route('show/componentfile', [$component->id, $file->id]) }}" class="btn btn-default">
                            <i class="fa fa-download" aria-hidden="true"></i>
                          </a>
                          @endif
                        </td>

                        <td>
                         {{$file->created_at}}
                        </td>


                        <td>
                          <a class="btn delete-asset btn-sm btn-danger btn-sm" href="{{ route('delete/componentfile', [$component->id, $file->id]) }}" data-tooltip="true" data-title="Delete" data-content="{{ trans('general.delete_confirm', ['item' => $file->filename]) }}"><i class="fa fa-trash icon-white" aria-hidden="true"></i></a>
                        </td>
                      </tr>
                    @endforeach
                </tbody>
              </table>

              @else

                <div class="alert alert-info alert-block">
                  <i class="fa fa-info-circle"></i>
                  {{ trans('general.no_results') }}
                </div>
              @endif

              </div> <!-- /.col-md-12 -->
          </div> <!-- row -->
        </div> <!-- /.tab-pane software -->
        
      </div> <!-- /. tab-content -->
    </div> <!-- /.nav-tabs-custom -->
  </div> <!-- /. col-md-12 -->
</div> <!-- /. row -->


@stop

@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'component' . $component->name . '-export', 'search' => false])
@include ('modals.upload-file', ['item_type' => 'component', 'item_id' => $component->id])
@stop
