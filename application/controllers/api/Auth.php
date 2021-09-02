<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'/libraries/Format.php';
require APPPATH.'/libraries/RestController.php';
use chriskacerguis\RestServer\RestController;

class Auth extends RestController{


    function __construct(){
        parent::__construct();
        //load form validation
        $this->load->library('form_validation');
        $this->load->model(['user_model','key_model']);
        $this->load->helper(['form','string']);
    }

    function register_post(){
        //get post variable
        $username = $this->post('username');
        $password = $this->post('password');
        $email = $this->post('email');
        //set result variable
        $result = array(
            'error' => false,
            'message' => ''
        );

        //check validation
        $this->_rules();

        if($this->form_validation->run() == FALSE){
            //show form error
            $result['error'] = true;
            $result['message'] = 'Error validation';
            $result['data'] = $this->form_validation->error_array();

            $this->response($result, parent::HTTP_BAD_REQUEST);
        }
        else
        {
            //prepare for insert data
            //hash the password
            $password_hash = password_hash($password, PASSWORD_DEFAULT);
            $data_user = array(
                'username' => $username,
                'password' => $password_hash,
                'email' => $email,
                'group' => 2, // define the group of user
                'create_by' => 'API',
            );
            
            if($this->config->item('rest_enable_otp'))
            {
                $data_user['otp'] = random_string('alnum',6); //create OTP register key for validation user
            }

            $user_id = $this->user_model->insert($data_user);

            //send OTP to email user registered

            //show result
            $result['error'] = false;
            $result['message'] = 'Registration success';
            if($this->config->item('rest_enable_otp'))
            {
                //send to mobile or other app to go to OTP page 
                $result['data'] = array('reg_success' => 1,'otp' => true);

            } else {
                //if not create API KEY TOKEN and return the data
                //generetae user token
                $key = $this->key_model->generate_key();
                $data_key = [
                    'level' => 1, 
                    'ignore_limits' => 1, 
                    'user_id' => $user_id,
                    'is_active' => 1
                ];

                $this->key_model->insert_key($key, $data_key );

                $result['data'] = $data_user; 
            }

            $this->response($result, parent::HTTP_OK);
        }

    }

    function verify_otp_post(){
        $kode_otp = $this->post('otp');

        //check otp
        $check = $this->user_model->getWhere(['otp' => $kode_otp])->row();
        
        if($check){
            $update_user = array(
                'otp' => '',
                'update_at' => date('Y-m-d H:i:s'),
                'update_by' => 'API',
                'is_active' => 1
            );
            //update user
            $update = $this->user_model->update($check->id, $update_user);

            if($update > 0)
            {
                //generetae user token
                $key = $this->key_model->generate_key();
                $data_key = [
                    'level' => 1, 
                    'ignore_limits' => 1, 
                    'user_id' => $check->id,
                    'ip_addresses' => $this->input->ip_address()
                ];

                $this->key_model->insert_key($key, $data_key );

                //set expired time login user
                //set expired next day from today
                //$time = time();
                //$expired = mktime(0,0,0,date("n", $time),date("j",$time)+ 1 ,date("Y", $time));
                
                $result['error'] = false;
                $result['message'] = 'Verification Success';
                $result['data'] = array(
                    'username' => $check->username,
                    'email' => $check->email,
                    'api_key' => $key,
                    'id_user' => $check->id,
                    'is_login' => 1, //set login status to tell app to go to dashboard or user member page
                    //'expired' => $expired
                );

                $this->response($result, parent::HTTP_OK);
            }
            else
            {
                $result['error'] = true;
                $result['message'] = 'Something error with database';
                $result['data'] = array();

                $this->response($result, parent::HTTP_BAD_REQUEST);
            }

        }
    }

    function login_post(){
        $username = $this->post('username');
        $password = $this->post('password');

        $this->_rules_login();

        if($this->form_validation->run() == FALSE){
            //show form error
            $result['error'] = true;
            $result['message'] = 'Error validation';
            $result['data'] = $this->form_validation->error_array();

            $this->response($result, parent::HTTP_BAD_REQUEST);
        }
        else
        {
            //check user by username
            $user = $this->user_model->getWhere(['username' => $username])->row();

            //if exist
            if($user){
                //check the password
                if(password_verify($password, $user->password)){
                    //get old api key by user id
                    $key = $this->key_model->get_key_by_user_id($user->id);
                    //regenerate new key
                    $new_key = $this->key_model->regenerate_key($key->key, $user->id);

                    //valid return user data
                    $result['error'] = false;
                    $result['message'] = 'Login Success';
                    $result['data'] = array(
                        'username' => $user->username,
                        'email' => $user->email,
                        'api_key' => $new_key,
                        'id_user' => $user->id,
                        'is_login' => 1,
                    );

                    $this->response($result, parent::HTTP_OK);
                }
                else
                {
                    //result error
                    $result['error'] = true;
                    $result['message'] = 'Your password did not match with our data.';

                    $this->response($result, parent::HTTP_BAD_REQUEST);
                }

            }
            else
            {
                //result error
                $result['error'] = true;
                $result['message'] = 'The username not found in our data.';

                $this->response($result, parent::HTTP_BAD_REQUEST);
            }
        }
    }

    function logout_post(){
        $username = $this->post('username');

        //check user by username
        $user = $this->user_model->getWhere(['username' => $username])->row();

        //if exist
        if($user){
            //get old api key by user id
            $key = $this->key_model->get_key_by_user_id($user->id);
            //suspend key
            $this->key_model->suspend_key($key->key);

            $result['error'] = false;
            $result['message'] = 'Logout Success';
    
            $this->response($result, parent::HTTP_OK);
           
        }
        else
        {
            //result error
            $result['error'] = true;
            $result['message'] = 'The username not found in our data.';

            $this->response($result, parent::HTTP_BAD_REQUEST);
        }

    }

    function _rules(){
        $this->form_validation->set_rules('username','Username','trim|required|min_length[4]');
        $this->form_validation->set_rules('password','Password','trim|required|min_length[8]');
        $this->form_validation->set_rules('email','Email','trim|required|valid_email');

    }

    function _rules_login(){
        $this->form_validation->set_rules('username','Username','trim|required|min_length[4]');
        $this->form_validation->set_rules('password','Password','trim|required|min_length[8]');
    }
}