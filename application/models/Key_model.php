<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @author Ifuk Permana
 * @copyright 2021
 * --------------------------------------------------------------------------
 *  Key Model
 * --------------------------------------------------------------------------
 * query to generate key token and save it to database
 *
 */

 class Key_model extends CI_Model{

    private $table;

    var $column_order = 'id,user_id,key,level,ignore_limits,is_private_key,ip_addresses,date_created'; //set column field database for datatable orderable
	var $key_column;
    var $primary = "id";
	var $order = array('id' => 'desc'); // default order

	function __construct()
	{
		parent::__construct();

        $this->key_column = config_item('rest_key_column');
        $this->table = config_item('rest_keys_table');

	}
    
    function generate_key()
    {
        do
        {
            // Generate a random salt
            $salt = base_convert(bin2hex($this->security->get_random_bytes(64)), 16, 36);

            // If an error occurred, then fall back to the previous method
            if ($salt === FALSE)
            {
                $salt = hash('sha256', time() . mt_rand());
            }

            $new_key = substr($salt, 0, config_item('rest_key_length'));
        }
        while ($this->_key_exists($new_key));

        return $new_key;
    }

    function regenerate_key($old_key, $user_id)
    {
        $key_details = $this->get_key($old_key);

        // Does this key exist?
        if (!$key_details)
        {
            return false;
        }

        // Build a new key
        $new_key = $this->generate_key();

        // Insert the new key
        if ($this->insert_key($new_key, ['level' => $key_details->level, 'ignore_limits' => $key_details->ignore_limits, 'user_id' => $user_id]))
        {
            // Suspend old key
            $this->update_key($old_key, ['level' => 0]);

            return $new_key;
        }
        else
        {
            return false;
        }
    }

    function suspend_key($key)
    {
        // Does this key exist?
        if (!$this->_key_exists($key))
        {
           return false; // BAD_REQUEST (400) being the HTTP response code
        }

        // Update the key level
        if ($this->update_key($key, ['level' => 0]))
        {
            return true; // OK (200) being the HTTP response code
        }
        else
        {
            return false; // INTERNAL_SERVER_ERROR (500) being the HTTP response code
        }
    }

    function change_level($key, $new_level)
    {
    
        // Does this key exist?
        if (!$this->_key_exists($key))
        {
            return false; // BAD_REQUEST (400) being the HTTP response code
        }

        // Update the key level
        if ($this->update_key($key, ['level' => $new_level]))
        {
            return true; // OK (200) being the HTTP response code
        }
        else
        {
            return false; // INTERNAL_SERVER_ERROR (500) being the HTTP response code
        }
    }
    
    function get_key($key)
    {
        return $this->db
            ->where($this->key_column, $key)
            ->get($this->table)
            ->row();
    }

    function get_key_by_user_id($user_id)
    {
        return $this->db
            ->where('user_id', $user_id)
            ->get($this->table)
            ->row();
    }

    function insert_key($key, $data)
    {
        $data[$this->key_column] = $key;
        $data['date_created'] = date('Y-m-d H:i:s');

        return $this->db
            ->set($data)
            ->insert($this->table);
    }

    function update_key($key, $data)
    {
        return $this->db
            ->where($this->key_column, $key)
            ->update($this->table, $data);
    }

    function delete_key($key)
    {
        return $this->db
            ->where($this->key_column, $key)
            ->delete($this->table);
    }

    private function _key_exists($key)
    {
        return $this->db
            ->where($this->key_column, $key)
            ->count_all_results($this->table) > 0;
    }

 }
