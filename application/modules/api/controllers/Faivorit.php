<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Faivorit extends API_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('User_model', 'users');
		$this->load->model('Notification_model', 'notis');
		$this->load->model('Faivorit_model', 'faivorites');
	}

	public function setFaivorit_post() {
		$from_id = $this->post("from_id");
		$to_id = $this->post('to_id');

		$where = array(
			'from_id' => $from_id,
			'to_id' => $to_id
		);

		$fav = $this->faivorites->get_where($where);
		if($fav) {
			$this->faivorites->delete($fav[0]->fid);
			$result = array(
				'status' => 1,
				'isFaivorit' => 0,
				'user' => $this->users->get($from_id)
			);
		} else {
			$where = array('from_id' => $from_id);
			$fav1 = $this->faivorites->get_where($where);

			if($fav1) {
				$this->faivorites->delete($fav1[0]->fid);
			}

			$new_fav = array(
				'from_id' => $from_id,
				'to_id' => $to_id
			);

			$this->faivorites->insert($new_fav);
			$result = array(
				'status' => 1,
				'isFaivorit' => 1,
				'user' => $this->users->get($from_id)
			);
		}

		$this->response($result);
	}

	public function getFaivoritWithUserId_post() {
		$userid = $this->post('userid');
		$where = array(
			'from_id' => $userid
		);

		$fav = $this->faivorites->get_where($where);
		if($fav) {
			$fav_user = $this->users->get($fav[0]->to_id);

			$result = array(
				'status' => 1,
				'isFav' => 1,
				'user' => $fav_user
			);
		} else {
			$result = array (
				'status' => 1,
				'isFav' => 0
			);
		}

		$this->response($result);
	}
}
