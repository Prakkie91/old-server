<?php 

class Order_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->primary_key = "order_id";
    }

    protected function callback_after_get($result = null)
    {
        if (isset($result->order_id)) {
            $sql = "SELECT * FROM car_types WHERE id = $result->car_type_id";
            $cartypes = $this->db->query($sql)->result();
            if(count($cartypes)>0) {
                $result->car_type = $cartypes[0]->type;
            }

            $sql = "SELECT * FROM ad_types WHERE id = $result->ad_type_id";
            $adtypes = $this->db->query($sql)->result();
            if(count($adtypes)>0) {
                $result->ad_type = $adtypes[0]->type;
            }

            $sql = "SELECT * FROM ad_regions WHERE id IN ("."$result->ad_ids".")";
            $ad_regions = $this->db->query($sql)->result();
            if(count($ad_regions)>0) {
                $result->ad_regions = $ad_regions;
            }

            /*$start_date = substr($result->ad_period, 0, 10);
            $end_date = substr($result->ad_period, 13, 10);

            $result->start_date = $start_date;
            $result->end_date = $end_date;

            if(time() - strtotime($end_date) > 0) {
                $result->isPassed = "true";
            } else {
                $result->isPassed = "false";
            }

            $datediff = strtotime($end_date) - strtotime($start_date);

            $result->order_days = strval(round($datediff / (60 * 60 * 24)));
            $result->order_months = strval(round($datediff / (60 * 60 * 24 * 30)));*/

            $end_date = substr($result->ad_period, 13, 10);

            if(time() - strtotime($end_date) > 0) {
                $result->isPassed = "true";
            } else {
                $result->isPassed = "false";
            }

            return $result;
        }
    }

    public function getAccountEarnInfo($user_id) {
        $sql = "SELECT COUNT(*) as count, SUM(total_amount) as total_amount FROM orders WHERE user_id = $user_id AND status = 'completed'";
        $results = $this->db->query($sql)->result();
        if (count($results) > 0) {
            return $results[0];
        }
        return null;
    }
}