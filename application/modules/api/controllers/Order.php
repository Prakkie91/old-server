<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends API_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('User_model', 'users');
		$this->load->model('Order_model', 'orders');
        $this->load->model('Ad_region_model', 'regions');
        $this->load->model('Record_model', 'records');
	}

	public function getAllOrders_post() {
	    $allOrders = $this->orders->get_all();

        $this->response(array(
            'status' => 1,
            'data' => $allOrders
        ));
    }

    public function getAllSameTypeOrdersWithUserId_post() {
        $user_id = $this->post('user_id');

        $car_type_id = $this->users->get($user_id)->car_type_id;
        $where = array(
            'car_type_id' => $car_type_id
        );

        $this->response(array(
            'status' => 1,
            'data' => $this->orders->get_where($where)
        ));
    }

    public function getAccountEarnInfo_post() {
        $user_id = $this->post('user_id');

        $results = $this->orders->getAccountEarnInfo($user_id);

        if ($results->count == 0) {
            $results->total_amount = "0";
        }

        $this->response(array(
                'status' => 1,
                'data' => $results
            ));
    }

    public function getAllRegions_post() {
        $regions = $this->regions->get_all();

        $this->response(array(
            'status' => 1,
            'data' => $regions
        ));
    }

    public function updateOrderStatus_post() {
        $status = $this->post('status');
        $user_id = $this->post('user_id');
        $order_id = $this->post('order_id');
        $inputs = $this->post();

        if ($status == "pending") {
            $data = array(
                'user_id' => 0,
                'status' => $status
            );
        } else {
            $data = array(
                'user_id' => $user_id,
                'status' => $status
            );
        }

        $order = $this->orders->get($order_id);
        if ($order) {
            $this->orders->update($order_id, $data);
            $this->response(array(
                'status' => 1,
                'data' => $this->orders->get($order_id)
            ));
        } else {
            $this->response(array(
                'status' => 0,
                'errorCode' => '1',
                'errorMessage' => 'There is no matched order',
                'inputs' => $inputs
            ));
        }
    }

    public function getOrderWithID_post() {
        $order_id = $this->post('order_id');

        $order = $this->orders->get($order_id);

        if ($order) {
            $this->response(array(
                'status' => 1,
                'data' => $order
            ));
        } else {
            $this->response(array(
                'status' => 0,
                'errorCode' => "1",
                'errorMessage' => "There is no matched order"
            ));
        }
    }

    public function hasAcceptedOrder_post() {
        $user_id = $this->post('user_id');

        $where = array(
            'user_id' => $user_id,
            'status' => 'accepted'
        );

        $orders = $this->orders->get_where($where);
        if(count($orders) > 0) {
            $this->response(array(
                'status' => 1,
                'data' => 'true'
            ));
        } else {
            $this->response(array(
                'status' => 1,
                'data' => 'false'
            ));
        }
    }

    public function saveRecord_post() {
        $user_id = $this->post('user_id');
        $lat = $this->post('lat');
        $lng = $this->post('lng');
        $speed = $this->post('speed'); // m/s
        $status = $this->post('status');

        $where = array(
            'user_id' => $user_id,
            'status' => 'accepted'
        );

        $acceptedOrders = $this->orders->get_where($where);

        foreach ($acceptedOrders as $ao) {
            $preRecords = $this->records->get_where(array(
                'user_id' => $user_id,
                'order_id' => $ao->order_id
            ));

            $preTime = 0;
            $cnt = count($preRecords);
            if ($cnt > 0) {
                $preTime = $preRecords[$cnt-1]->created_at;
            }

            $curTime = time();
            $data = array(
                'id' => null,
                'user_id' => $user_id,
                'order_id' => $ao->order_id,
                'lat' => $lat,
                'lng' => $lng,
                'speed' => $speed,
                'status' => $status,
                'distance' => '0',
                'created_at' => $curTime
            );

            $r_id = $this->records->insert($data);

            $between = $curTime - $preTime;
            if($between < 5*60) {
                // 5min max

                $dis = round($speed * $between);

                $this->records->update_field($r_id, 'distance', $dis);
            }
        }

        $this->response(array(
            'status' => 1
        ));
    }
}
