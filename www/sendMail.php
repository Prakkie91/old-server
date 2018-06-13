<?php
function sendMail($to, $message) {
    $from_email = "BeonDriver@support.com";
    $from_name = 'BeonDriver';
    $subject = "Forgot Password";

    $html_message = "
                <html>
                <body>
                    <div>
                        <p>$message</p>
                    </div>
                </body>
                </html>
            ";

    $html_message = "
                <html>
                <head>
                    <title>BeonDriver - Forgot password</title>
                </head>
                <body>
                    <div>
                        <h3>Forgot Password</h3>
		                Verify code for reset password: <h3 style='display: inline'>$message</h3>
                    </div>
                </body>
                </html>
            ";

    $headers = "From: ".$from_name."<".$from_email.">" . "\r\n" .
        "Content-type: text/html; charset=utf8" . "\r\n".
        "X-Mailer: PHP/" . phpversion();

    $result = array();

    if(mail($to, $subject, $html_message, $headers)){
        //$result = 1;
        $result =  array(
            'to' => $to,
            'message' => $message,
            'status' => 1
        );
    } else {
        //$result = 0;
        $result =  array(
            'to' => $to,
            'message' => $message,
            'status' => 0
        );
    }

    return $result;
}
/*$from_email = "Qworkhelp@gmail.com";
$from_name = 'Qwork';
$to      = $_POST['to'];
$subject = "Forgot Password";
$message = $_POST['message'];
$html_message = "
                <html>
                <body>
                    <div>
                        <p>$message</p>
                    </div>
                </body>
                </html>
            ";

$headers = 'From: '.$from_name.'<'.$from_email.'>' . "\r\n" .
	'Content-type: text/html; charset=utf8' . "\r\n".
    'X-Mailer: PHP/' . phpversion();

$data = array();
if(mail($to, $subject, $html_message, $headers)){
	$data['status'] = 'success';
} else {
	$data['status'] = 'fail';
}
	echo json_encode($data);*/
?> 