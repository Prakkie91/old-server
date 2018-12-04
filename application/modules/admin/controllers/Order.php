<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
        $this->load->model('Order_model', 'orders');
        $this->load->model('Car_type_model', 'car_types');
        $this->load->model('Ad_type_model', 'ad_types');
        $this->load->model('User_model', 'users');
        $this->load->model('Ad_region_model', 'ad_regions');
        $this->load->model('Record_model', 'records');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('orders');
		$crud->columns('order_id', 'ad_ids', /*'Map',*/ 'car_type_id', 'ad_theme', 'ad_type_id', 'ad_size', 'ad_period', 'amount', 'status', 'user_id', 'created_at');

        $crud->display_as('ad_ids', 'Ad Regions');
        $crud->display_as('car_type_id', 'Car type');
        $crud->display_as('ad_type_id', 'Ad type');
        $crud->display_as('ad_size', 'Ad size (m x m)');
        $crud->display_as('amount', 'Amount (HKD)');
        $crud->display_as('user_id', 'Driver');

        $crud->callback_column('ad_ids', array($this, 'callback_ad_regions'));
        $crud->callback_column('user_id', array($this, 'callback_user'));
        //$crud->callback_column('Map', array($this, 'callback_addresses'));

		$crud->set_relation('car_type_id', 'car_types', 'type');
		$crud->set_relation('ad_type_id', 'ad_types', 'type');

        $crud->unset_add();
        $crud->unset_edit();

		$this->mPageTitle = 'Orders';
		$this->render_crud();
	}

	// Create Frontend User
	public function create()
	{
		$form = $this->form_builder->create_form();

		if ($form->validate())
		{
			// passed validation
			$ad_info = $this->input->post('ad_info'); //address
			$car_type = $this->input->post('car_type');
            $ad_theme = $this->input->post('ad_theme');
            $ad_type = $this->input->post('ad_type');
            $ad_size = $this->input->post('ad_size');
            $ad_period = $this->input->post('ad_period');
            $amount = $this->input->post('amount');

            $start_date = substr($ad_period, 0, 10);
            $end_date = substr($ad_period, 13, 10);

            if(time() - strtotime($end_date) > 0) {
                $isPassed = "true";
            } else {
                $isPassed = "false";
            }

            $datediff = strtotime($end_date) - strtotime($start_date);

            $order_days = strval(round($datediff / (60 * 60 * 24)));
            $order_months = strval($datediff / (60 * 60 * 24 * 30));
            $total_amount = round($order_months * $amount);

            $ad_ids = array();
            $ad_region_json = json_decode($ad_info);

            //for debug
            /*$this->mViewData['data'] = $ad_region_json;
            $this->render('order/debug');*/

            foreach ($ad_region_json as $arj) {
                $ad_region = $arj->address;
                $lat = $arj->lat;
                $lng = $arj->lng;
                $radius = $arj->radius;

                $ad_id = $this->ad_regions->insert(array(
                    'id' => null,
                    'ad_region' => $ad_region,
                    'lat' => $lat,
                    'lng' => $lng,
                    'radius' => $radius,
                    'order_id' => 0
                ));

                $ad_ids[] = $ad_id;
            }


            $car_type_id = $this->car_types->get_first_one_where('type', $car_type)->id;
            $ad_type_id = $this->ad_types->get_first_one_where('type', $ad_type)->id;

            $order = array(
                'order_id' => null,
                'ad_ids' => implode(",", $ad_ids),
                'car_type_id' => $car_type_id,
                'ad_theme' => $ad_theme,
                'ad_type_id' => $ad_type_id,
                'ad_size' => $ad_size,
                'ad_period' => $ad_period,
                'ad_start' => $start_date,
                'ad_end' => $end_date,
                'order_days' => $order_days,
                'order_months' => $order_months,
                'amount' => $amount,
                'total_amount' => $total_amount,
                'status' => "pending",
                'created_at' => date('Y-m-d H:i:s')
            );

            $order_id = $this->orders->insert($order);
            $ao = array(
                'order_id' => $order_id
            );

            foreach ($ad_ids as $ad_id) {
                $this->ad_regions->update($ad_id, $ao);
            }

			refresh();
		}

		// pass data to view
		$this->mViewData['car_type_array'] = $this->car_types->get_all();
        $this->mViewData['ad_type_array'] = $this->ad_types->get_all();
		$this->mPageTitle = 'Create Order';

		$this->mViewData['form'] = $form;
		$this->render('order/create');
	}

    public function location($order_id){
        $order = $this->orders->get($order_id);

        $this->load->library('googlemaps');
        $config['zoom'] = '15';
        $config['center'] = $order->lat . ', ' . $order->lng;
        $this->googlemaps->initialize($config);


        $marker['position'] = $order->lat . ', ' . $order->lng;
        $marker['infowindow_content'] = $order->ad_region;
        $this->googlemaps->add_marker($marker);

        $circle['center'] = $order->lat. ', '. $order->lng;
        $circle['radius'] = $order->radius * 1000;
        $this->googlemaps->add_circle($circle);

        $this->mTitle = 'Order ('. $order->order_id .') Location: ' . $order->ad_region;
        $this->mViewData['map'] = $this->googlemaps->create_map();
        $this->render('map/map');
    }

    public function locations($order_id){
        $order = $this->orders->get($order_id);
        $aids = $order->ad_ids;
        $ad_ids = explode(",", $aids);

        $this->load->library('googlemaps');
        $config['zoom'] = '14';

        foreach ($ad_ids as $ad_id) {
            $ad = $this->ad_regions->get($ad_id);

            $config['center'] = $ad->lat . ', ' . $ad->lng;
        }

        $this->googlemaps->initialize($config);

        foreach ($ad_ids as $ad_id) {
            $ad = $this->ad_regions->get($ad_id);

            $marker['position'] = $ad->lat . ', ' . $ad->lng;
            $marker['infowindow_content'] = $ad->ad_region;
            $this->googlemaps->add_marker($marker);

            $circle['center'] = $ad->lat. ', '. $ad->lng;
            $circle['radius'] = $ad->radius * 1000;
            $this->googlemaps->add_circle($circle);
        }

        $this->mTitle = 'Order ('. $order->order_id .')';
        $this->mViewData['map'] = $this->googlemaps->create_map();
        $this->render('map/map');
    }

    /*public function record_map($record_id) {
        $record = $this->records->get($record_id);

        $this->load->library('googlemaps');
        $config['zoom'] = '17';
        $config['center'] = $record->lat . ',' . $record->lng;

        $this->googlemaps->initialize($config);

        $marker['position'] = $record->lat . ', ' . $record->lng;
        $marker['infowindow_content'] = "Current Location";
        $this->googlemaps->add_marker($marker);

        $where = array(
            'user_id' => $record->user_id,
            'order_id' => $record->order_id,
            'id <=' => $record_id
        );
        $pre_records = $this->records->get_where($where);

        $points = array();
        $sub_points = array();
        $created_at = 0;
        foreach ($pre_records as $pr) {
            if ($pr->created_at - $created_at > 5 * 60) { // 5min
                if (count($sub_points) > 0) {
                    $points[] = $sub_points;
                    $sub_points = array();
                }
            }

            $sub_points[] = $pr->lat . ',' . $pr->lng;
            $created_at = $pr->created_at;
        }

        foreach ($points as $point) {
            $polyline['points'] = $point;

            $this->googlemaps->add_polyline($polyline);
        }

        $this->mTitle = 'Record ('. $record_id .')';
        $this->mViewData['map'] = $this->googlemaps->create_map();
        $this->render('map/map');
    }*/

    public function record_map($record_id) {
        $record = $this->records->get($record_id);

        $this->load->library('googlemaps');
        $config['zoom'] = '17';
        $config['center'] = $record->lat . ',' . $record->lng;

        $this->googlemaps->initialize($config);

        $marker['position'] = $record->lat . ', ' . $record->lng;
        $marker['infowindow_content'] = "Current Location";
        $this->googlemaps->add_marker($marker);

        $where = array(
            'user_id' => $record->user_id,
            'order_id' => $record->order_id,
            'id <=' => $record_id
        );
        $pre_records = $this->records->get_where($where);

        $points = array();
        foreach ($pre_records as $pr) {
            $points[] = $pr->lat . ',' . $pr->lng;
        }

        $polyline['points'] = $points;

        $this->googlemaps->add_polyline($polyline);

        $this->mTitle = 'Record ('. $record_id .')';
        $this->mViewData['map'] = $this->googlemaps->create_map();
        $this->render('map/map');
    }

    public function records($order_id) {
        $crud = $this->generate_crud('records');
        $crud->columns('id', 'user_id', 'order_id', 'lat', 'lng', 'speed', 'distance', 'time');

        $crud->add_action('View Map', '', 'admin/order/record_map', 'fa fa-map-marker fa-2x');

        $order = $this->orders->get($order_id);
        $where = array(
            'order_id' => $order_id,
            'user_id' => $order->user_id
        );
        $crud->where($where);

        $crud->display_as('speed', "Speed (m/s)");
        $crud->display_as('distance', "Distance (Km)");
        $crud->display_as('user_id', 'Driver');
        $crud->callback_column('user_id', array($this, 'callback_user_record'));

        $crud->callback_column('distance', array($this, 'callback_distance'));

        $crud->unset_add();
        $crud->unset_edit();

        $this->mPageTitle = 'Records';
        $this->render_crud();
    }

    public function callback_ad_regions($value, $row) {
        $order = $this->orders->get($row->order_id);
        $content = '<ul>';

        $aids = $order->ad_ids;
        $ad_ids = explode(",", $aids);

        foreach ($ad_ids as $ad_id) {
            $ad = $this->ad_regions->get($ad_id);
            $content .= '<li>'.wordwrap($ad->ad_region. ' ('. $ad->radius. 'Km)', 30, "<br>", true).'</li>';
        }

        $content .= '</ul>';

        $html = '<a href="' . base_url() . 'admin/order/locations/' . $row->order_id . '">' . $content . '</a>';
        //$html = $content;
        return $html;
    }

    public function callback_addresses($value, $row)
    {
        $point = '<img style=\'width:20px; height:20px\' src=\''.base_url().'/assets/images/point.png\'/>';
        return '<a href="' . base_url() . 'admin/order/locations/' . $row->order_id . '">' . $point . '</a>';
    }

    public function callback_user($value, $row)
    {
        $order = $this->orders->get($row->order_id);
        $user = $this->users->get($order->user_id);

        if ($user) {
            $driver = '<a href="' . base_url() . 'admin/order/records/' . $row->order_id . '">'. $user->username . ' (' . $user->email . ')' . '</a>';
        } else {
            $driver = 'No Driver';
        }
        return $driver;
    }

    public function callback_user_record($value, $row)
    {
        $order = $this->orders->get($row->order_id);
        $user = $this->users->get($order->user_id);

        if ($user) {
            $driver = $user->username . ' (' . $user->email . ')';
        } else {
            $driver = 'No Driver';
        }
        return $driver;
    }

    public function callback_distance($value, $row)
    {
        $order = $this->orders->get($row->order_id);

        $where = array(
            'order_id' => $order->order_id,
            'user_id' => $order->user_id,
            'id <' => $row->id
        );

        $distance = 0;
        $records = $this->records->get_where($where);
        foreach ($records as $r) {
            $distance = $distance + $r->distance;
        }

        return $distance/1000; //km
    }

    function distance($lat1, $lon1, $lat2, $lon2, $unit) {

        $theta = $lon1 - $lon2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $unit = strtoupper($unit);

        if ($unit == "K") {
            return ($miles * 1.609344);
        } else if ($unit == "N") {
            return ($miles * 0.8684);
        } else {
            return $miles;
        }
    }
}
