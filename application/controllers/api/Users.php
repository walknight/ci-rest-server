<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'/libraries/Format.php';
require APPPATH.'/libraries/RestController.php';
use chriskacerguis\RestServer\RestController;

class Users extends RestController{

    function __construct(){
        parent::__construct();

        //load model user for database query
        $model = array('user_model');
        $this->load->model($model);
        //set default response variable for client
        $result = array(
            'error' => true,
            'message' => 'Response message',
        );

    }

    /* =========================================
    /* THIS IS NOT REQUIRED API KEY 
    /* CAN SET IN config REST.php Line 182 
    /* ========================================= */
    public function index_get(){
        $this->result['error'] = false;
        $this->result['message'] = 'User API Controller';
        $this->response($this->result, 200 );
    }

    public function user_data_get()
    {
        $id = $this->input->get('id');

        $this->result['error'] = false;
        $this->result['message'] = 'user data';
        $this->result['data'] = array('id' => $id);
        $this->response($this->result, 200 );


    }

    public function check_login_post($identity, $password)
    {

    }

    public function is_valid_api($api_key)
    {

    }


}