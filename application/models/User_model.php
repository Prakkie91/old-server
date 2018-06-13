<?php

class User_model extends MY_Model
{

    protected function callback_after_get($result = null)
    {
        if (isset($result->id)) {
            $sql = "SELECT * FROM car_types WHERE id = $result->car_type_id";
            $cartypes = $this->db->query($sql)->result();
            if(count($cartypes)>0) {
                $result->car_type = $cartypes[0]->type;
            }


            return $result;
        }
    }
}