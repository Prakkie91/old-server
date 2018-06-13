<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function index()
	{
		$this->load->model('user_model', 'users');
        $this->load->model('order_model', 'orders');
		$this->mViewData['user_count'] = array(
			'users' => $this->users->count_all(),
		);
        $this->mViewData['order_count'] = array(
            'orders' => $this->orders->count_all(),
        );
		$this->render('home');
	}
}
