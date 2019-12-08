<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'/libraries/Format.php';
require APPPATH.'/libraries/RestController.php';
use chriskacerguis\RestServer\RestController;

class Users extends RestController{

    function __construct(){
        parent::__construct();
        
    }

    public function index_get(){
        $this->response([
            'error' => false,
            'message' => 'Welcome to Episces API v1.0',
        ], 200 );
    }
}