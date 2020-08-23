<?php

namespace App\Console\Commands;

use App\Helpers\Helper;
use App\Models\Asset;
use App\Models\License;
use App\Models\Mail;
use App\Models\Setting;
use App\Notifications\ExpiringAssetsNotification;
use App\Models\Recipients;
use DB;
use Illuminate\Console\Command;
use Carbon\Carbon;

class SendEmailNotification extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'snipeit:send-email-notification';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send email & notifications.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //Hết hạn bảo hành
        $query = "SELECT u.id,u.first_name,u.last_name,u.email 
            FROM users AS u 
                LEFT JOIN settings AS s ON s.user_id=u.id
            WHERE u.activated=1 AND s.audit_warning_days_1_email=1";
        $users = DB::select(DB::raw($query));
        foreach($users AS $user){
            $arr_item = Helper::checkNotification(1,$user->id,0);
            if(count($arr_item)){
                $subject = "Thông báo tài sản sắp hết hạn bảo hành";
                $body = "<p>Bạn có ".count($arr_item)." tài sản sắp hết hạn bảo hành</p>";
                foreach($arr_item AS $item){
                    $body.="<p> - ".$item['name']." hết hạn ".$item['date']."</p>";
                }
                $result= Mail::sendSingleMail($user->email,$subject,$body);
                if($result){
                    foreach($arr_item AS $item){
                        DB::table('log_send_mail')->insert(
                            ['type' => 1, 'data_id' => $item['id'],'created_at'=>date('Y-m-d H:i:s')]
                        );
                    }
                }
            }
        }
        // Hết  khấu hao
        $query = "SELECT u.id,u.first_name,u.last_name,u.email 
            FROM users AS u 
                LEFT JOIN settings AS s ON s.user_id=u.id
            WHERE u.activated=1 AND s.audit_warning_days_2_email=1";
        $users = DB::select(DB::raw($query));
        foreach($users AS $user){
            $arr_item = Helper::checkNotification(2,$user->id,0);
            if(count($arr_item)){
                $subject = "Thông báo tài sản sắp hết khấu hao";
                $body = "<p>Bạn có ".count($arr_item)." tài sản sắp hết khấu hao</p>";
                foreach($arr_item AS $item){
                    $body.="<p> - ".$item['name']." hết khấu hao ".$item['date']."</p>";
                }
                $result= Mail::sendSingleMail($user->email,$subject,$body);
                if($result){
                    foreach($arr_item AS $item){
                        DB::table('log_send_mail')->insert(
                            ['type' => 2, 'data_id' => $item['id'],'created_at'=>date('Y-m-d H:i:s')]
                        );
                    }
                }
            }
        }
        // Phần mềm hết bản quyền
        $query = "SELECT u.id,u.first_name,u.last_name,u.email 
            FROM users AS u 
                LEFT JOIN settings AS s ON s.user_id=u.id
            WHERE u.activated=1 AND s.audit_warning_days_3_email=1";
        $users = DB::select(DB::raw($query));
        foreach($users AS $user){
            $arr_item = Helper::checkNotification(3,$user->id,0);
            if(count($arr_item)){
                $subject = "Thông báo phần mềm sắp hết hạn bản quyền";
                $body = "<p>Bạn có ".count($arr_item)." phần mềm sắp hết hạn bản quyền</p>";
                foreach($arr_item AS $item){
                    $body.="<p> - ".$item['name']." hết hạn ".$item['date']."</p>";
                }
                $result= Mail::sendSingleMail($user->email,$subject,$body);
                if($result){
                    foreach($arr_item AS $item){
                        DB::table('log_send_mail')->insert(
                            ['type' => 3, 'data_id' => $item['id'],'created_at'=>date('Y-m-d H:i:s')]
                        );
                    }
                }
            }
        }
        echo "ok";
    }
}
