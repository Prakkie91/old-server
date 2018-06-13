<?php 

class Image_upload_model extends MY_Model {

    public function get_where ($where) {
        $this->where = $where;
        return $this->get_all();
    }

    public function getAllImagesWithBarbershopId($userid) {
        $sql = "SELECT * FROM image_uploads WHERE (user_id = $userid OR user_id IN (SELECT id FROM users where included_shop_id = $userid)) AND (status = 1) ORDER BY created_on DESC";
        $data = $this->db->query($sql)->result();
        return $data;
    }

    public function deleteImagesWithIds($uids) {

        $sql = "UPDATE image_uploads SET status = 0 WHERE uid IN ($uids)";
        $result = $this->db->query($sql);
        return $result;
    }
}