<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Image_upload extends API_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Image_upload_model', 'imageUploads');
		$this->load->model('User_model', 'users');
		$this->load->model('Order_model', 'orders');
		$this->load->model('Notification_model', 'notis');
	}

	public function getAllImagesWithUserId_post() {
		$userid = $this->post('userid');
		$user = $this->users->get($userid);

		$data = array();
		if($user->user_type == 'barber') {
			$where = array (
				'user_id' => $userid,
				'status' => 1
			);

			$images = $this->imageUploads->order_by(array('created_on' => 'DESC'))->get_where($where);

			$data = array(
				'status' => 1,
				'data' => $images
			);
		} else if ($user->user_type == 'barber_shop') {
			$images = $this->imageUploads->getAllImagesWithBarbershopId($userid);

			$data = array(
				'status' => 1,
				'data' => $images
			);
		} else {
			$data = array(
				'status' => 0,
				'error' => 'There is no images, This user is customer, Customer can not upload images'
			);
		}

		$this->response($data);
	}

	public function uploadImageWithUserId_post() {
		$userid = $this->post('userid');

		if(is_uploaded_file($_FILES['file']['tmp_name'])) {
			$path = UPLOAD_IMAGE_PATH;
			//$path = 'assets/uploads/';

			$micro_time = microtime();
			$fileName = str_replace(' ', '_', ("image_" . $micro_time . '.jpg'));
			$file_path = $path . $fileName;

			$tmpFile = $_FILES['file']['tmp_name'];
			if(move_uploaded_file($tmpFile, $file_path)){
				$data = array(
					'user_id' => $userid,
					'image_url' => $file_path
				);

				if($this->imageUploads->insert($data)){
					$result = array(
						'status' => 1,
						'data' => $file_path
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
					'error' => 'Image Upload Failed-'.$file_path
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

	public function deleteImageWithIds_post() {
		$uids = $this->post('uids');

		$uid_array = explode(",", $uids);
		$isSuccess = $this->imageUploads->deleteImagesWithIds($uids);

		if($isSuccess) {
			$result = array(
				'status' => 1,
				'data' => $uid_array
			);
		} else {
			$result = array(
				'status' => 0,
				'error' => 'Not Deleted, please try again'
			);
		}

		$this->response($result);
	}
}
