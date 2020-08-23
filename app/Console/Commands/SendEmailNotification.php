<?php

namespace App\Console\Commands;

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
        $result= Mail::sendSingleMail('thanhcong1710@gmail.com','gửi mail','guiwrmail demo 32463453');
        var_dump($result);die();


    }
}
