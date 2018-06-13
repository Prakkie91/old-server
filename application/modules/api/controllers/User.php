<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include("www/sendMail.php");

class User extends API_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('User_model', 'users');
		$this->load->model('Order_model', 'orders');
	}

	public function getAllUsers_post()
	{
		$data = $this->users
			->get_all();
		$this->response($data);
	}

	public function getUserWithId_post()
	{
		$u_id = $this->post('user_id');
		$user = $this->users->get($u_id);

		$result = array(
			'status' => 1,
			'data' => $user
		);
		$this->response($result);
	}

	public function signup_post()
	{
		// required fields
		$first_name = $this->post('first_name');
        $last_name = $this->post('last_name');
        $email = $this->post('email');
        $password = $this->post('password');
        $birthday = $this->post('birthday');
        $phone = $this->post('phone');
        $driving_license_number = $this->post('driving_license_number');
        $driving_license_expiry_date = $this->post('driving_license_expiry_date');
        $driving_license_class = $this->post('driving_license_class');
        $car_type = $this->post('car_type');
        $vehicle_plate_number = $this->post('vehicle_plate_number');
        $plate_number_expiry_date = $this->post('plate_number_expiry_date');
        $photo_vehicle = null;
        $photo_plate_number = null;

        $inputs = $this->post();
        $inputs['photo_vehicle'] = $photo_vehicle;
        $inputs['photo_plate_number'] = $photo_plate_number;

        $errorCode = null;
        $errorMessage = null;

        if(!isset($first_name)) {
            $errorCode = 1;
            $errorMessage = "First name missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($last_name)) {
            $errorCode = 2;
            $errorMessage = "Last name missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($email)) {
            $errorCode = 3;
            $errorMessage = "Email missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($password)) {
            $errorCode = 4;
            $errorMessage = "Password missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($birthday)) {
            $errorCode = 5;
            $errorMessage = "Birth date missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($phone)) {
            $errorCode = 6;
            $errorMessage = "Phone number missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($driving_license_number)) {
            $errorCode = 7;
            $errorMessage = "Driving license number missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($driving_license_expiry_date)) {
            $errorCode = 8;
            $errorMessage = "Driving license expiry date missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($driving_license_class)) {
            $errorCode = 9;
            $errorMessage = "Driver license class missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($car_type)) {
            $errorCode = 10;
            $errorMessage = "Car type missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "inputs" => $errorMessage,
                "errorMessage" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($vehicle_plate_number)) {
            $errorCode = 11;
            $errorMessage = "Vehicle plate number missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($plate_number_expiry_date)) {
            $errorCode = 12;
            $errorMessage = "Plate number expiry date missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(is_uploaded_file($_FILES['photo_vehicle']['tmp_name'])) {
            if ($_FILES['photo_vehicle']['size'] > 0) {

            } else {
                $inputs['photo_vehicle'] = $_FILES['photo_vehicle']['error'];
                $errorCode = 20;
                $errorMessage = "Vehicle photo file size is 0";

                $result = array(
                    "status" => 0,
                    "errorCode" => $errorCode,
                    "errorMessage" => $errorMessage,
                    "inputs" => $inputs
                );
                $this->response($result);
                return;
            }

            $path = UPLOAD_PROFILE_PHOTO;

            $inputs['photo_vehicle'] = "is_upload_file_success";

            $micro_time = microtime();
            $fileName = str_replace(' ', '_', ("photo_vehicle" . $micro_time . '.jpg'));
            $file_path = $path . $fileName;

            $tmpFile = $_FILES['photo_vehicle']['tmp_name'];
            if(move_uploaded_file($tmpFile, $file_path)){
                $photo_vehicle = $fileName;
                $inputs['photo_vehicle'] = $photo_vehicle;
            }
        }

        if (!isset($photo_vehicle)) {
            $errorCode = 13;
            $errorMessage = "Vehicle photo upload failed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(is_uploaded_file($_FILES['photo_plate_number']['tmp_name'])) {
            if ($_FILES['photo_plate_number']['size'] > 0) {

            } else {
                $inputs['photo_plate_number'] = $_FILES['photo_plate_number']['error'];
                $errorCode = 21;
                $errorMessage = "Vehicle plate number photo file size is 0";

                $result = array(
                    "status" => 0,
                    "errorCode" => $errorCode,
                    "errorMessage" => $errorMessage,
                    "inputs" => $inputs
                );
                $this->response($result);
                return;
            }

            $path = UPLOAD_PROFILE_PHOTO;

            $micro_time = microtime();
            $fileName = str_replace(' ', '_', ("photo_plate_number" . $micro_time . '.jpg'));
            $file_path = $path . $fileName;

            $tmpFile = $_FILES['photo_plate_number']['tmp_name'];
            if(move_uploaded_file($tmpFile, $file_path)){
                $photo_plate_number = $fileName;
                $inputs['photo_plate_number'] = $photo_plate_number;
            }
        }

        if (!isset($photo_plate_number)) {
            $errorCode = 14;
            $errorMessage = "Vehicle plate number photo upload failed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        // check user duplicated or not via email
        $users = $this->users->get_where(array('email'=>$email));
        if(count($users)>0) {
            $errorCode = 15;
            $errorMessage = "Duplicated user";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        // proceed to create user
        /** ion_auth->register (name, password, email, additional_data, group) */
        // set user to "members" group
        $group = array('1');

        $this->load->model('car_type_model', 'cars');
        $car_type_id = $this->cars->get_first_one_where('type', $car_type)->id;

        $additional_data = array(
            'username' => $first_name. ' '. $last_name,
            'first_name' => $first_name,
            'last_name' => $last_name,
            'birthday' => $birthday,
            'phone' => $phone,
            'driving_license_number' => $driving_license_number,
            'driving_license_expiry_date' => $driving_license_expiry_date,
            'driving_license_class' => $driving_license_class,
            'car_type_id' => $car_type_id,
            'vehicle_plate_number' => $vehicle_plate_number,
            'plate_number_expiry_date' => $plate_number_expiry_date,
            'photo_vehicle' => $photo_vehicle,
            'photo_plate_number' => $photo_plate_number
        );

        $user_id = $this->ion_auth->register($first_name. ' '. $last_name, $password, $email, $additional_data, $group);

        if(isset($user_id)) {
            $user = $this->users->get($user_id);

            $user->photo_vehicle = base_url(). UPLOAD_PROFILE_PHOTO. $user->photo_vehicle;
            $user->photo_plate_number = base_url(). UPLOAD_PROFILE_PHOTO. $user->photo_plate_number;

            $result = array(
                "status" => 1,
                "data" => $user
            );

            $this->response($result);
            return;
        } else {
            // ion_auth error (unknown error)
            $this->error($this->ion_auth->errors());
        }
	}

	public function login_post()
	{
		$email = $this->post('email');
		$password = $this->post('password');
        $one_id_ios = $this->post('one_id_ios');
        $one_id_android = $this->post('one_id_android');

        $inputs = $this->post();

        if(!isset($email)) {
            $errorCode = 1;
            $errorMessage = "Email missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

        if(!isset($password)) {
            $errorCode = 2;
            $errorMessage = "Password missed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );
            $this->response($result);
            return;
        }

		// proceed to login user
		$remember = FALSE;
		$logged_in = $this->ion_auth->login($email, $password, $remember);
		if ($logged_in)
		{
			// get User object and remove unnecessary fields
			//$user = $this->ion_auth->user()->row();
			//$user = $this->users->get($user->id);
			$user = $this->users->get_first_one_where('email', $email);
			$this->users->update($user->id, array('one_id_ios' => $one_id_ios));
			$this->users->update($user->id, array('one_id_android' => $one_id_android));

            /*unset($user->password);
			unset($user->salt);
			unset($user->ip_address);
			unset($user->activation_code);
			unset($user->forgotten_password_code);
			unset($user->forgotten_password_time);
			unset($user->remember_code);
			unset($user->company);
			unset($user->created_on);
			unset($user->last_login);*/

            $user->photo_vehicle = base_url(). UPLOAD_PROFILE_PHOTO. $user->photo_vehicle;
            $user->photo_plate_number = base_url(). UPLOAD_PROFILE_PHOTO. $user->photo_plate_number;

			// return result
			$result = array(
				"status" => 1,
				"data" => $user
			);
			$this->response($result);
		}
		else
		{
			$this->error($this->ion_auth->errors());
			// check - login with username
			/*$loggedUserWithUsernames = $this->users->select('id, username, email, user_type, first_name, last_name, photo, gender, phone, fb_id, tw_id, paid_date, active')->get_where('username', $email);
			foreach ($loggedUserWithUsernames as $loguser){
				$loggedUserWithUsername = $loguser;
			}
			if(count($loggedUserWithUsernames)>0) {
				$result = array(
					"status" => 1,
					"data" => $loggedUserWithUsername
				);
				$this->response($result);
			} else {
				$this->error($this->ion_auth->errors());
			}*/
		}
	}

	public function upload_cur_location_post() {
        $user_id = $this->post('user_id');
	    $lat = $this->post('lat');
        $lng = $this->post('lng');
        $speed = $this->post('speed');

        $inputs = $this->post();

        $data = array(
            'lat' => $lat,
            'lng' => $lng,
            'speed' => $speed
        );

        $user = $this->users->get($user_id);
        if ($user) {

            $this->users->update($user_id, $data);
            $this->response(array(
                'status' => 1
            ));
        } else {
            $errorCode = 1;
            $errorMessage = "update failed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );

            $this->response($result);
            return;
        }
    }

    public function update_profile_post() {
        $user_id = $this->post('user_id');
        $first_name = $this->post('first_name');
        $last_name = $this->post('last_name');
        $birthday = $this->post('birthday');
        $phone = $this->post('phone');

        $inputs = $this->post();

        $data = array(
            'username' => $first_name. ' '. $last_name,
            'first_name' => $first_name,
            'last_name' => $last_name,
            'birthday' => $birthday,
            'phone' => $phone
        );

        $user = $this->users->get($user_id);

        if($user) {
            $this->users->update($user_id, $data);
            $result = array(
                'status' => 1
            );

            $this->response($result);
            return;
        } else {
            $errorCode = 1;
            $errorMessage = "update failed";

            $result = array(
                "status" => 0,
                "errorCode" => $errorCode,
                "errorMessage" => $errorMessage,
                "inputs" => $inputs
            );

            $this->response($result);
            return;
        }
    }

	public function login_fb_post()
	{
		$fb_id = $this->post('fb_id');
		$email = $this->post('email');
		$one_id_ios = $this->post('one_id_ios');
		$one_id_android = $this->post('one_id_android');

		if($one_id_android == null || !isset($one_id_android)) {
			$one_id_android = "";
		}
		if($one_id_ios == null || !isset($one_id_ios)) {
			$one_id_ios = "";
		}

		$user_data = array(
			"fb_id" => $fb_id,
			"email" => $email,
			"one_id_ios" => $one_id_ios,
			"one_id_android" => $one_id_android
		);

		$user = $this->users->get_where(array('fb_id' => $fb_id));
		if(count($user)>0){
			$user1 = $user[0];
			$this->users->update($user1->id, array('one_id_ios' => $one_id_ios));
			$this->users->update($user1->id, array('one_id_android' => $one_id_android));
			$result = array (
				"status" =>1,
				"data" => $user1,
				"isRegister" => 'false'
			);
			/*if($user1->email===$email){
				$result = array (
					"status" =>1,
					"data" => $user1
				);
			} else {
				$this->users->update($user1->id, $user_data);
				$result = array (
					"status" =>1,
					"data" => $this->users->get($user1->id)
				);
			}*/
		} else {
			$user_id = $this->users->insert($user_data);
			//$user_data['id'] = $user_id;
			$user_data = $this->users->get($user_id);
			$result = array (
				"status" =>1,
				"data" => $user_data,
				"isRegister" => 'true'
			);
		}
		$this->response($result);
	}

	public function login_google_post()
	{
		$g_id = $this->post('g_id');
		$email = $this->post('email');
		$one_id_ios = $this->post('one_id_ios');
		$one_id_android = $this->post('one_id_android');
		//$username = $this->post('username');
		if($one_id_android == null || !isset($one_id_android)) {
			$one_id_android = "";
		}
		if($one_id_ios == null || !isset($one_id_ios)) {
			$one_id_ios = "";
		}

		$user_data = array(
			"g_id" => $g_id,
			"email" => $email,
			"one_id_ios" => $one_id_ios,
			"one_id_android" => $one_id_android
			//"username" => $username
		);

		$user = $this->users->get_where(array('g_id' => $g_id));
		if(count($user)>0){
			$user1 = $user[0];
			$this->users->update($user1->id, array('one_id_ios' => $one_id_ios));
			$this->users->update($user1->id, array('one_id_android' => $one_id_android));
			$result = array (
				"status" =>1,
				"data" => $user1,
				"isRegister" => 'false'
			);
		} else {
			$user_id = $this->users->insert($user_data);
			//$user_data['id'] = $user_id;
			$user_data = $this->users->get($user_id);
			$result = array (
				"status" =>1,
				"data" => $user_data,
				"isRegister" => 'true'
			);
		}
		$this->response($result);
	}

	public function login_twitter_post()
	{
		$tw_id = $this->post('tw_id');
		//$username = $this->post('username');
		$email = $this->post('email');
		$one_id_ios = $this->post('one_id_ios');
		$one_id_android = $this->post('one_id_android');
		if($one_id_android == null || !isset($one_id_android)) {
			$one_id_android = "";
		}
		if($one_id_ios == null || !isset($one_id_ios)) {
			$one_id_ios = "";
		}

		$user_data = array(
			"tw_id" => $tw_id,
			//"username" => $username,
			"email" => $email,
			"one_id_ios" => $one_id_ios,
			"one_id_android" => $one_id_android
		);

		$user = $this->users->get_where(array('tw_id' => $tw_id));
		if(count($user)>0){
			$user1 = $user[0];
			$this->users->update($user1->id, array('one_id_ios' => $one_id_ios));
			$this->users->update($user1->id, array('one_id_android' => $one_id_android));
			$result = array (
				"status" =>1,
				"data" => $user1,
				"isRegister" => 'false'
			);

		} else {
			$user_id = $this->users->insert($user_data);
			//$user_data['id'] = $user_id;
			$user_data = $this->users->get($user_id);
			$result = array (
				"status" =>1,
				"data" => $user_data,
				"isRegister" => 'true'
			);
		}
		$this->response($result);
	}

	public function logout_post() {
		$userid = $this->post('userid');
		$this->users->update($userid, array('one_id_ios' => ''));
		$this->users->update($userid, array('one_id_android' => ''));
		$this->response(array('status'=>1));
	}

	/*public function forgot_password_email_post() {
		$email = $this->post('email');
		$result = sendMail($email, "Test email");
		//$this->response(array('status' => $result));
		$this->response($result);
	}

	public function forgot_password_post()
	{
		$email = $this->post('email');
		$password = $this->post('password');
		if($this->ion_auth->reset_password($email, $password)) {
			$result = array(
				'status' => 1
			);
		} else {
			$result = array(
				'status' => 0
			);
		}

		$this->response($result);
	}*/

    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    function generateRandomString1($length = 8) {
        return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
    }

	public function forgot_password_post()
	{
		// proceed to forgot password
		$email = $this->post('email');
		//$forgotten = $this->ion_auth->forgotten_password($email);
        $code = $this->generateRandomString(6);

        $where = array(
            'email' => $email
        );

        $user = $this->users->get_first_one_where($where);
        if ($user) {
            $this->users->update_field($user->id, 'forgotten_password_code', $code);

            //$code = $code;
            $mail_send = sendMail($email, $code);
            if($mail_send['status']) {
                $result = array(
                    'status' => 1,
                    'message' => 'Sent code to ' . $email
                );
            } else {
                $result = array(
                    'status' => 0,
                    'error' => 'Fail to send mail to ' . $email
                );
            }

            $this->response($result);
        } else {
            $this->response(array(
                'status' => 0,
                'message' => 'Wrong email'
            ));

            return;
        }
/*
		if ($forgotten)
		{
			// TODO: send email to user
			$code = $forgotten['forgotten_password_code'];
			$mail_send = sendMail($email, $code);
			if($mail_send['status']) {
				$result = array(
					'status' => 1,
					'message' => 'Sent code to ' . $email
				);
			} else {
				$result = array(
					'status' => 0,
					'error' => 'Fail to send mail to ' . $email
				);
			}
		}
		else
		{
			//$this->error($this->ion_auth->errors());
			$result = array(
				'status' => 0,
				'error' => 'Fail to send mail to ' . $email
			);
		}

		$this->response($result);*/
	}

	public function reset_password_post()
	{
		// proceed to reset password
		$code = $this->post('code');
		$password = $this->post('password');

		// verify passwords are the same (TODO: better validation)
		$reset = $this->ion_auth->forgotten_password_complete($code);

		if ($reset)
		{
			// proceed to change user password
			$updated = $this->ion_auth->reset_password($reset['identity'], $password);
			//($updated) ? $this->success($this->ion_auth->messages()) : $this->error($this->ion_auth->errors());
			if($updated) {
				$result = array(
					'status' => 1
				);
			} else {
				$result = array(
					'status' => 0,
					'error' => 'Invalid code'
				);
			}
		}
		else
		{
			//$this->error($this->ion_auth->errors());
			$result = array(
				'status' => 0,
				'error' => 'Invalid code'
			);
		}

		$this->response($result);
	}


	public function init_customer_profile_post()
	{
		$userid = $this->post('userid');
		$username = $this->post('username');
		$phone = $this->post('phone');
		$gender = $this->post('gender');
		$birthday = $this->post('birthday');

		$result = array();

		if(is_uploaded_file($_FILES['file']['tmp_name'])) {
			$path = UPLOAD_PROFILE_PHOTO;
			//$path = 'assets/uploads/';

			$micro_time = microtime();
			$fileName = str_replace(' ', '_', ("photo_" . $micro_time . '.jpg'));
			$file_path = $path . $fileName;

			$tmpFile = $_FILES['file']['tmp_name'];
			if(move_uploaded_file($tmpFile, $file_path)){
				$user_data = array(
					'username' => $username,
					'birthday' => $birthday,
					'phone' => $phone,
					'gender' => $gender,
					'photo' => $file_path,
					'user_type' => 'customer',
					'active' => 1
				);

				if($this->users->update($userid, $user_data)){
					$user = $this->users->get($userid);
					$result = array(
						'status' => 1,
						'data' => $user
					);
				} else {
					$result = array(
						'status' => 0,
						'error' => 'Error'
					);
				}
			} else {
				$result = array(
					'status' => 0,
					'error' => 'Photo Upload Failed-'.$file_path
				);
			}
		} else {
			$result = array(
				'status' => 0,
				'error' => 'There is no uploaded file'
			);
		}
		$this->response($result);
	}

	public function getFlag_get() {
		$result = array(
			'status' => 1 //allow
		);
		$this->response($result);
	}

	public function init_barber_profile_post()
	{
		$userid = $this->post('userid');
		$username = $this->post('username');
		$phone = $this->post('phone');
		$gender = $this->post('gender');
		$birthday = $this->post('birthday');
		$description = $this->post('description');
		$included_shop_id = $this->post('included_shop_id');
		$fb_profile_link = $this->post('fb_profile_link');
		$instagram_profile_link = $this->post('instagram_profile_link');
		$twt_profile_link = $this->post('twt_profile_link');

		$result = array();
		if(is_uploaded_file($_FILES['file']['tmp_name'])) {
			$path = UPLOAD_PROFILE_PHOTO;
			//$path = 'assets/uploads/';

			$micro_time = microtime();
			$fileName = str_replace(' ', '_', ("photo_" . $micro_time . '.jpg'));
			$file_path = $path . $fileName;

			$tmpFile = $_FILES['file']['tmp_name'];
			if(move_uploaded_file($tmpFile, $file_path)){
				$user_data = array(
					'username' => $username,
					'birthday' => $birthday,
					'phone' => $phone,
					'gender' => $gender,
					'description' => $description,
					'included_shop_id' => $included_shop_id,
					'fb_profile_link' => $fb_profile_link,
					'instagram_profile_link' => $instagram_profile_link,
					'twt_profile_link' => $twt_profile_link,
					'photo' => $file_path,
					'user_type' => 'barber',
					'active' => 1
				);

				if($this->users->update($userid, $user_data)){
					$user = $this->users->get($userid);
					$result = array(
						'status' => 1,
						'data' => $user
					);
				} else {
					$result = array(
						'status' => 0,
						'error' => 'Error'
					);
				}
			} else {
				$result = array(
					'status' => 0,
					'error' => 'Photo Upload Failed-'.$file_path
				);
			}
		} else {
			$result = array(
				'status' => 0,
				'error' => 'There is no uploaded file'
			);
		}
		$this->response($result);
	}

	public function init_barbershop_profile_post()
	{
		$userid = $this->post('userid');
		$username = $this->post('username');
		$phone = $this->post('phone');
		$address = $this->post('address');
		$lati = $this->post('latitude');
		$lang = $this->post('longitude');
		$work_time_start = $this->post('work_time_start');
		$work_time_end = $this->post('work_time_end');
		$sat_time_start = $this->post('sat_time_start');
		$sat_time_end = $this->post('sat_time_end');
		$sun_time_start = $this->post('sun_time_start');
		$sun_time_end = $this->post('sun_time_end');
		$description = $this->post('description');
		$fb_profile_link = $this->post('fb_profile_link');
		$instagram_profile_link = $this->post('instagram_profile_link');
		$twt_profile_link = $this->post('twt_profile_link');

		$result = array();
		if(is_uploaded_file($_FILES['file']['tmp_name'])) {
			$path = UPLOAD_PROFILE_PHOTO;
			//$path = 'assets/uploads/';

			$micro_time = microtime();
			$fileName = str_replace(' ', '_', ("photo_" . $micro_time . '.jpg'));
			$file_path = $path . $fileName;

			$tmpFile = $_FILES['file']['tmp_name'];
			if(move_uploaded_file($tmpFile, $file_path)){
				$user_data = array(
					'username' => $username,
					'phone' => $phone,
					'address' => $address,
					'lati' => $lati,
					'lang' => $lang,
					'photo' => $file_path,
					'work_time_start' => $work_time_start,
					'work_time_end' => $work_time_end,
					'sat_time_start' => $sat_time_start,
					'sat_time_end' => $sat_time_end,
					'sun_time_start' => $sun_time_start,
					'sun_time_end' => $sun_time_end,
					'description' => $description,
					'fb_profile_link' => $fb_profile_link,
					'instagram_profile_link' => $instagram_profile_link,
					'twt_profile_link' => $twt_profile_link,
					'user_type' => 'barber_shop',
					'active' => 1
				);

				if($this->users->update($userid, $user_data)){
					$user = $this->users->get($userid);
					$result = array(
						'status' => 1,
						'data' => $user
					);
				} else {
					$result = array(
						'status' => 0,
						'error' => 'Error'
					);
				}
			} else {
				$result = array(
					'status' => 0,
					'error' => 'Photo Upload Failed-'.$file_path
				);
			}
		} else {
			$result = array(
				'status' => 0,
				'error' => 'There is no uploaded file'
			);
		}
		$this->response($result);
	}

	public function getBarbersInOneBarbershop_post() {
		$barbershop_id = $this->post('bs_id');
		$where = array(
			'included_shop_id' => $barbershop_id,
			'user_type' => 'barber',
			'active' => 1
		);
		$barbers = $this->users->get_where($where);
		$result = array(
			'status' => 1,
			'data' => $barbers
		);
		$this->response($result);
	}

	public function getShopBarbersInOneBarbershop_post() {
		$barbershop_id = $this->post('bs_id');
		$barbershop = $this->users->get($barbershop_id);
		$where = array(
			'included_shop_id' => $barbershop_id,
			'user_type' => 'barber',
			'active' => 1
		);
		$barbers = $this->users->get_where($where);
		$result = array(
			'status' => 1,
			'barbers' => $barbers,
			'barbershop' => $barbershop
		);
		$this->response($result);
	}

	public function getAllBarbershops_post() {
		$where = array(
			'user_type' => 'barber_shop',
			'active' => 1
		);
		$barbershops = $this->users->get_where($where);
		$result = array (
			'status' => 1,
			'data' => $barbershops
		);

		$this->response($result);
	}

	public function getFaivoritBarberInfo_post() {
		$fid = $this->post('fid');

		$activeOrders = $this->orders->getAllActiveOrdersWithBarberId($fid);
		$cut_result = $this->orders->getAverageCuttingTimeWithBarberId($fid);
		if($cut_result->count == 0) {
			$average_cutting_time = 0;
		} else {
			$average_cutting_time = round($cut_result->sum / $cut_result->count);
		}

		$result = array(
			'status' => 1,
			'barber' => $this->users->get($fid),
			'count' => count($activeOrders),
			'average_cutting_time' => $average_cutting_time
		);

		$this->response($result);
	}

	public function getCustomerAndFavouriteBarverWithCustomerId_post() {
		$userid = $this->post('user_id');
		$user = $this->users->get($userid);
		if(isset($user->faivorit_barber_id) && $user->faivorit_barber_id != null && $user->faivorit_barber_id != "") {
			$favBarber = $this->users->get($user->faivorit_barber_id);

			$result = array (
				'status' => 1,
				'user' => $user,
				'favBarber' => $favBarber
			);
		} else {
			$result = array (
				'status' => 1,
				'user' => $user,
				'favBarber' => ""
			);
		}

		$this->response($result);
	}

	public function getAllBarbershopsAndIsJoinedWithCustomerId_post() {
		$c_id = $this->post('customer_id');
		$where = array(
			'user_type' => 'barber_shop',
			'active' => 1
		);
		$barbershops = $this->users->get_where($where);

		$xth = 0;
		$minute = 0;
		$barber = array();

		$cur_order = $this->orders->getCurOrderWithCustomerId($c_id);
		if(count($cur_order) > 0) {
			// joined
			$order = $cur_order[0];
			$barber_id = $order->barber_id;
			$this->users->get_where(array());
			$barber = $this->users->get($barber_id);
			$activeOrders = $this->orders->getAllActiveOrdersWithBarberId($barber_id);
			if(count($activeOrders) > 0) {
				$cut_result = $this->orders->getAverageCuttingTimeWithBarberId($barber_id);
				if($cut_result->count == 0) {
					$average_cutting_time = 0;
				} else {
					$average_cutting_time = round($cut_result->sum / $cut_result->count);
				}
				for($i=0;$i<count($activeOrders);$i++) {
					if($c_id == $activeOrders[$i]->customer_id) {
						$xth = $i+1;
						$minute = round(($i) * round($average_cutting_time / 60));
					}
				}
			} else {
				// there is no active orders for this barber
				// same as not joined case
			}
		} else {
			// not joined
		}

		$result = array(
			'status' => 1,
			'barbershops' => $barbershops,
			'xth' => strval($xth), // $xth == 0: means this customer not joined to any barber queue
			'minute' => strval($minute),
			'barber' => $barber
		);

		$this->response($result);
	}

	public function getAllBarbers_post() {
		$where = array(
			'user_type' => 'barber',
			'active' => 1
		);

		$barbers = $this->users->get_where($where);
		$result = array (
			'status' => 1,
			'data' => $barbers
		);

		$this->response($result);
	}

	public function searchBarber_ShopWithName_post() {
		/*$name = $this->post('username');
		$where = array (
			'user_type' => 'barber_shop',
			'username like' => '%'.$name.'%'
		);
		$data = $this->users->get_where($where);
		$result = array (
			'status' => 1,
			'data' => $data
		);
		$this->response($result);*/

		$name = $this->post('username');
		$data = $this->users->searchBarber_Shop($name);

		foreach($data as $d) {
			if($d->user_type == 'barber') {
				$this->getBarberExtraFields($d);
			} else if($d->user_type == 'barber_shop') {
				$this->getBarbershopExtraFields($d);
			}
		}

		$result = array (
			'status' => 1,
			'data' => $data
		);
		$this->response($result);
	}

	function getBarberExtraFields($barber) {
		$sql = "SELECT SUM(rating) / COUNT(order_id) as rating,
							(SELECT username FROM users WHERE id = $barber->included_shop_id) as barbershop_name,
							(SELECT id FROM users WHERE id = $barber->included_shop_id) as barbershop_id,
							(SELECT COUNT(rating) FROM orders WHERE rating = 5 AND status = 'end' AND barber_id = $barber->id) as count5,
							(SELECT COUNT(rating) FROM orders WHERE rating = 4 AND status = 'end' AND barber_id = $barber->id) as count4,
							(SELECT COUNT(rating) FROM orders WHERE rating = 3 AND status = 'end' AND barber_id = $barber->id) as count3,
							(SELECT COUNT(rating) FROM orders WHERE rating = 2 AND status = 'end' AND barber_id = $barber->id) as count2,
							(SELECT COUNT(rating) FROM orders WHERE rating = 1 AND status = 'end' AND barber_id = $barber->id) as count1,
							(SELECT COUNT(order_id) FROM orders WHERE barber_id = $barber->id AND (status = 'waiting' OR status = 'start')) as cur_count
						FROM orders WHERE status = 'end' AND barber_id = $barber->id AND rating > 0";
		$rating = $this->db->query($sql)->result();
		$barber->rating = $rating[0]->rating;
		if($barber->rating == null) {
			$barber->rating = 0;
		}
		$barber->rating = number_format($barber->rating, 1);
		$barber->count5 = $rating[0]->count5;
		$barber->count4 = $rating[0]->count4;
		$barber->count3 = $rating[0]->count3;
		$barber->count2 = $rating[0]->count2;
		$barber->count1 = $rating[0]->count1;
		$barber->cur_count = $rating[0]->cur_count;
		$barber->barbershop_name = $rating[0]->barbershop_name;
		$barber->barbershop_id = $rating[0]->barbershop_id;
	}

	function getBarbershopExtraFields($barbershop) {
		$sql = "SELECT SUM(rating) / COUNT(rating) as rating FROM orders WHERE rating > 0 AND barber_id IN (SELECT id FROM users WHERE user_type = 'barber' AND included_shop_id = $barbershop->id)";
		$rating = $this->db->query($sql)->result();
		$rating = $rating[0];
		if($rating->rating == null) {
			$rating->rating = 0;
		}
		$barbershop->rating = number_format($rating->rating, 1);
		$sql = "SELECT COUNT(*) as count FROM orders WHERE (status = 'waiting' OR status = 'start') AND (barber_id IN (SELECT id FROM users WHERE included_shop_id = $barbershop->id))";
		$barbershop->totalCustomerCount = $this->db->query($sql)->result()[0]->count;
		return $barbershop;
	}

	public function online_offline_post() {
		$barber_id = $this->post('barber_id');
		$online_status = $this->users->get($barber_id)->online_status;
		if($online_status == 'online') {
			$online_status = 'offline';
		} else {
			$online_status = 'online';
		}
		$this->users->update($barber_id, array('online_status' => $online_status));

		$result = array(
			'status' => 1,
			'online_status' => $online_status
		);
		$this->response($result);
	}

	public function getBarbersWithBarbershopId_post () {
		$bs_id = $this->post('bs_id');
		$where = array(
			'included_shop_id' => $bs_id,
			'active' => 1
		);
		$barbers = $this->users->get_where($where);
		$result = array(
			'status' => 1,
			'data' => $barbers
		);
		$this->response($result);
	}

	public function addCustomerManually_post() {
		$barber_id = $this->post('barber_id');
		$username = $this->post('username');
		$guest_user = array(
			'username' => $username,
			'is_guest' => 'guest'
		);
		$user_id = $this->users->insert($guest_user);
		$order = array(
			'barber_id' => $barber_id,
			'customer_id' => $user_id,
			'status' => 'waiting'
		);
		$this->orders->insert($order);
		$customers = $this->orders->getCustomersWithBarberId($barber_id);

		$result = array(
			'status' => 1,
			'customers' => $customers
		);

		$this->response($result);
	}

	public function removeBarberFromBarberShop_post() {
		$bs_id = $this->post('bs_id');
		$b_id = $this->post('b_id');

		$where = array(
			'id' => $b_id,
			'included_shop_id' => $bs_id
		);

		$barber = $this->users->get_where($where)[0];
		$this->users->update_field($barber->id, 'included_shop_id', 0);

		$this->users->get_where(array());
		$where = array(
			'included_shop_id' => $bs_id,
			'user_type' => 'barber',
			'active' => 1
		);
		$barbers = $this->users->get_where($where);
		$result = array(
			'status' => 1,
			'data' => $barbers
		);

		$this->response($result);
	}
}
