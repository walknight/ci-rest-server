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
        $this->load->model('user_model');
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
                'register_key' => random_string('alnum',6), //create OTP register key for validation user
                'user_type' => 2,
                'create_by' => 'API',
            );

            $this->user_model->insert($data_user);

            //send OTP to email user registered

            //show result
            $result['error'] = false;
            $result['message'] = 'Registration success';
            $result['data'] = $data_user; //array('reg_success' => 1,'otp' => true)

            $this->response($result, parent::HTTP_OK);
        }

    }

    function verify_otp_post(){
        $kode_otp = $this->post('otp');

        //check otp
        $check = $this->user_model->getWhere(['register_key' => $kode_otp])->result();
        
        if($check){
            $update_user = array(
                'register_key' => '',
                'api_key' => base_convert(bin2hex($this->security->get_random_bytes(64)), 16, 36),
                'update_at' => date('Y-m-d H:i:s'),
                'update_by' => 'API',
                'is_active' => 1
            );
            
            //update user
            $update = $this->user_model->update($check[0]->id, $update_user);

            if($update > 0)
            {
                $result['error'] = false;
                $result['message'] = 'Verification Success';
                $result['data'] = array(
                    'username' => $check[0]->username,
                    'email' => $check[0]->email,
                    'api_key' => $update_user['api_key'],
                    'is_login' => 1
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
            $user = $this->user_model->getWhere(['username' => $username])->result();

            //if exist
            if($user){
                //check the password
                if(password_verify($password, $user[0]->password)){
                    //valid return user data
                    $result['error'] = false;
                    $result['message'] = 'Login Success';
                    $result['data'] = array(
                        'username' => $user[0]->username,
                        'email' => $user[0]->email,
                        'api_key' => $user[0]->api_key,
                        'id_user' => $user[0]->id,
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