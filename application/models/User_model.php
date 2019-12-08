<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @author Ifuk Permana
 * @application newopenblog
 * @copyright 2011
 * --------------------------------------------------------------------------
 *  User Model
 * --------------------------------------------------------------------------
 * query untuk mengambil data user website serta menampilkannya
 *
 */

 class User_model extends CI_Model{

	private $_table = "users";

    var $column_order = 'id,username,email,api_key,is_active,created_at,update_at'; //set column field database for datatable orderable
    var $column_search = 'user_name,email,user_type'; //set column field database for datatable searchable
	var $order = array('id' => 'desc'); // default order
	var $primary = "id";

	function __construct()
	{
		parent::__construct();

	}

	/**
	* Get and return all records from DB table.
	*
	* @access public
	* @param string
	* @return object
	*/
	public function getAll($field = "", $order_by = "", $limit = "", $offset = "")
	{
        if($limit != "" || $offset != "")
        {
            $this->db->limit($limit,$offset);
        }

		if($order_by != "")
		{
			$this->db->order_by($order_by);
		}
		if(is_array($field) AND $field != "")
		{
			$this->db->select($field);
		}

		$result = $this->db->get($this->_table);

		if($result->num_rows() > 0)
		{
			return $result;
		}
		else
		{
			return FALSE;
		}
	}


	/**
	* Get and return specified record from DB table.
	*
	* @access public
	* @param array
	* @return object
	*/
	public function getWhere($params, $order_by = NULL)
	{
		if($order_by)
		{
			$this->db->order_by($order_by);
		}
		$result = $this->db->get_where($this->_table, $params);

		return $result;
	}


	/**
	* Get and return specified record from DB table by id.
	*
	* @access public
	* @param int
	* @return object
	*/
	public function get($id)
	{
		$result = $this->db->get_where($this->_table, array($this->primary => $id));

		if($result->num_rows() > 0)
		{
			return $result->row();
		}
		else
		{
			return FALSE;
		}
	}


	/**
	* Add new record to DB table.
	*
	* @access public
	* @param array
	* @return bool
	*/
	public function insert($params)
	{
        //check username and email
        $query_check = $this->db->query("select * from ".$this->_table." where username ='".$params['username']."' or email = '".$params['email']."'");

        if($query_check->num_rows() > 0)
        {
            return false;
        }
        else
        {
            //insert into data_content table
            $this->db->insert($this->_table, $params);
            $query = $this->db->insert_id();

            if($query > 0)
            {
                return $query;
            } else {
                return false;
            }
        }

	}



	/**
	* Update existing record in DB table.
	*
	* @access public
	* @param int
	* @param array
	* @return bool
	*/
	public function update($id, $params)
	{
		$this->db->update($this->_table, $params, array($this->primary => $id));
		return $this->db->affected_rows();
	}


	/**
	* Delete specified records from the DB table.
	*
	* @access public
	* @param array
	* @return bool
	*/
	public function delete($id)
	{
		$this->db->delete($this->_table, array($this->primary => $id));
		return $this->db->affected_rows();
	}


    public function count_aktif()
    {
        $this->db->where('is_active',1);
        $query = $this->db->get($this->_table);

        return $query->num_rows();
    }


    public function count_data()
    {
        return $this->db->count_all($this->_table);
    }


     // datatables
    function data_table() {
        $this->datatables->select($this->column_order);
        $this->datatables->from($this->_table);
        //add this line for join
        //$this->datatables->join('table2', 'mdcategory.field = table2.field');
        $this->datatables->add_column('action', anchor(site_url('admin/users/view/$1'),'View')." | ".
                                                anchor(site_url('admin/users/edit/$1'),'Edit')." | ".
                                                anchor(site_url('admin/users/delete/$1'),'Delete','onclick="javasciprt: return confirm(\'Are You Sure ?\')"'), 'id_user');
        return $this->datatables->generate();
    }


}
