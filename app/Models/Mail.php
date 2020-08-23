<?php
/**
 * Created by PhpStorm.
 * User: PMTB
 * Date: 3/13/2018
 * Time: 9:28 AM
 */

namespace App\Models;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

class Mail
{
    public static function sendSingleMail($to, $subject, $body, $arr_cc = [], $arr_att = []) {
        $mail = new PHPMailer();
        $result="";

        if(!empty($to)){
            try{
                $mail->isSMTP();
                $mail->SMTPOptions = array(
                    'ssl' => array(
                        'verify_peer' => false,
                        'verify_peer_name' => false,
                        'allow_self_signed' => true
                    )
                );
                $mail->CharSet = 'utf-8';
                $mail->Host = env('MAIL_HOST');
                $mail->SMTPAuth = true;
                $mail->Username =  env('MAIL_USERNAME');
                $mail->Password = env('MAIL_PASSWORD');
                $mail->SMTPSecure = 'tls';
                $mail->Port = env('MAIL_PORT');

                $mail->setFrom(env('MAIL_USERNAME'), env('MAIL_FROM_NAME'));
                $mail->addAddress($to);
                if(!empty($arr_cc)){
                    foreach($arr_cc AS $cc){
                        $mail->addCC($cc);
                    }
                }

                // Attachments
                if(!empty($arr_att)){
                    foreach($arr_att AS $item) {
                        $item = (Object)$item;
                        $mail->addAttachment(DIRECTORY . DS . $item->url, $item->name); 
                    }
                }

                //Content
                $mail->isHTML(true);
                $mail->Subject = $subject;
                $mail->Body    = $body;
                $result=$mail->send();
                var_dump($result);die();
            }catch (Exception $exception){
            }
        }
        return $result;
    }
}
