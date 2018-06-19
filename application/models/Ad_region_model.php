<?php 

class Ad_region_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();
    }


    public function getAllSameTypeRegionsWithUserId($car_type_id) {
        $sql = "SELECT * FROM ad_regions WHERE order_id IN (SELECT order_id FROM orders WHERE car_type_id = " . $car_type_id . ")";
        return $regions = $this->db->query($sql)->result();
    }

}