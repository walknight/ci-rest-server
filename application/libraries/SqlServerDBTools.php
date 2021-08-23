<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/* 
    Library for result multi query sql server
*/

class SqlServerDBTools {
    
    protected $CI;
    
    public function __construct($params = array())
    {

        $this->CI =& get_instance();
        
        if( array_key_exists('group_name', $params) ){
            $this->db = $this->CI->load->database($params['group_name'], TRUE);
        } else {
            $this->db = $this->CI->load->database();
        }
         
    }

    public function do_query($querystring)
    {
        $query = sqlsrv_query($this->db->conn_id, $querystring);

        $resultSets = array();

        do {
            $array = array();
                
            while( $row = sqlsrv_fetch_array( $query, SQLSRV_FETCH_ASSOC )) {
                $array[] = $row;
            }

            $resultSets[] = $array;

        } while (sqlsrv_next_result($query));

        return $resultSets;
    }
}
