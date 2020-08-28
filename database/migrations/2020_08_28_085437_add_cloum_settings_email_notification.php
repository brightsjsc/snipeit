<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddCloumSettingsEmailNotification extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::table('settings', function($table)
        {
            $table->smallInteger('audit_warning_days_1_notification')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_1_email')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_1')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_2_notification')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_2_email')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_2')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_3_notification')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_3_email')->nullable()->default('0');
            $table->smallInteger('audit_warning_days_3')->nullable()->default('0');
            

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
