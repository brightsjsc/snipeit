<?php

return array(

    'does_not_exist' => 'Model tài sản không tồn tại.',
    'assoc_users'	 => 'Model này hiện tại đang liên kết với ít nhất một hoặc nhiều tài sản và không thể xóa. Xin vui lòng xóa tài sản, và cố gắng thử lại lần nữa. ',


    'create' => array(
        'error'   => 'Model tài sản chưa được tạo, xin thử lại.',
        'success' => 'Model tài sản đã tạo thành công.',
        'duplicate_set' => 'Model tài sản này có tên, nhà sản xuất hoặc mã tài sản đã tồn tại.',
    ),

    'update' => array(
        'error'   => 'Model tài sản chưa cập nhật, xin thử lại',
        'success' => 'Model tài sản đã cập nhật thành công.'
    ),

    'delete' => array(
        'confirm'   => 'Bạn có chắc muốn xóa Model tài sản này?',
        'error'   => 'Có vấn đề xảy ra khi xóa Model tài sản. Xin thử lại.',
        'success' => 'Model tài sản đã xóa thành công.'
    ),

    'restore' => array(
        'error'   		=> 'Model tài sản chưa được phục hồi, xin thử lại',
        'success' 		=> 'Model tài sản đã được phục hồi thành công.'
    ),

    'bulkedit' => array(
        'error'   		=> 'Không có trường nào được thay đổi, vì vậy không có gì được cập nhật.',
        'success' 		=> 'Các mô hình được cập nhật.'
    ),

    'bulkdelete' => array(
        'error'   		    => 'Không có mục nào được chọn, nên không có gì bị xóa cả.',
        'success' 		    => ':succes_count model(s) đã được xóa!',
        'success_partial' 	=> ':success_count model(s) Model tài sản đã được xóa, tuy nhiên có :fail_count loại không cho phép xóa vì chúng vẫn còn gắn liên kết đết tài sản.'
    ),

);
