<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'/libraries/Format.php';
require APPPATH.'/libraries/RestController.php';
use chriskacerguis\RestServer\RestController;

class Sqltest extends RestController{

    function __construct(){
        parent::__construct();

        $this->load->library('sqlserverdbtools', array('group_name' => 'sqllocal'));
    }
    
    public function index_get(){
                
        $query = $this->sqlserverdbtools->do_query('EXEC sp_multiResult');

        // echo "<pre>";
        // print_r($query);
        // exit;
        
        $this->response([
            'error' => false,
            'message' => 'SqlServer testing multi result',
            'data' => $query,
        ], 200 );
    }
}