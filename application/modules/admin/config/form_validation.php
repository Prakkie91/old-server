<?php

/**
 * Config file for form validation
 * Reference: http://www.codeigniter.com/user_guide/libraries/form_validation.html
 * (Under section "Creating Sets of Rules")
 */

$config = array(

	// Admin User Login
	'login/index' => array(
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
	),

	// Create User
	'user/create' => array(
		array(
			'field'		=> 'first_name',
			'label'		=> 'First Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'last_name',
			'label'		=> 'Last Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'is_unique[users.username]',				// use email as username if empty
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email|is_unique[users.email]',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[password]',
		),
	),

	// Reset User Password
	'user/reset_password' => array(
		array(
			'field'		=> 'new_password',
			'label'		=> 'New Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[new_password]',
		),
	),

	// Create Admin User
	'panel/admin_user_create' => array(
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'required|is_unique[users.username]',
		),
		array(
			'field'		=> 'first_name',
			'label'		=> 'First Name',
			'rules'		=> 'required',
		),
		/* Admin User can have no email
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'valid_email|is_unique[users.email]',
		),*/
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[password]',
		),
	),

	// Reset Admin User Password
	'panel/admin_user_reset_password' => array(
		array(
			'field'		=> 'new_password',
			'label'		=> 'New Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[new_password]',
		),
	),

	// Admin User Update Info
	'panel/account_update_info' => array(
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
	),

	// Admin User Change Password
	'panel/account_change_password' => array(
		array(
			'field'		=> 'new_password',
			'label'		=> 'New Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[new_password]',
		),
	),

    // Order create
    'order/create' => array(
        /*array(
            'field'		=> 'ad_region',
            'label'		=> 'Ad Region',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'latitude',
            'label'		=> 'Latitude',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'longitude',
            'label'		=> 'Longitude',
            'rules'		=> 'required',
        ),*/
        array(
            'field'		=> 'car_type',
            'label'		=> 'Car Type',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'ad_theme',
            'label'		=> 'Ad Theme',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'ad_type',
            'label'		=> 'Ad Type',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'ad_size',
            'label'		=> 'Ad Size',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'ad_period',
            'label'		=> 'Ad Period',
            'rules'		=> 'required',
        ),
        array(
            'field'		=> 'amount',
            'label'		=> 'Amount',
            'rules'		=> 'required|numeric',
        ),
        /*array(
            'field'		=> 'radius',
            'label'		=> 'Radius',
            'rules'		=> 'required|numeric',
        )*/
        array(
            'field'     => 'ad_info',
            'label'     => 'Ad Regions and Radius',
            'rules'		=> 'required',
        )
    )


);