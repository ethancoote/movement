function controls_setup(){
	buffer_time = 5;
	jump_key_buffered = 0;
	jump_key_buffer_time = 0;
}

function get_controls(_i){
	// dir inputs
	right_key = keyboard_check( vk_right ) || (gamepad_axis_value(_i, gp_axislh) > 0.8);
	left_key = keyboard_check( vk_left ) || (gamepad_axis_value(_i, gp_axislh) < -0.8);
	right_key_walk = (gamepad_axis_value(_i, gp_axislh) > 0) && (gamepad_axis_value(_i, gp_axislh) < 0.8);
	left_key_walk = (gamepad_axis_value(_i, gp_axislh) < 0) && (gamepad_axis_value(_i, gp_axislh) > -0.8);
	crouch_key = keyboard_check( vk_down ) || (gamepad_axis_value(_i, gp_axislv) > 0);
	
	// action inputs
	jump_key_pressed = keyboard_check_pressed( vk_space ) || gamepad_button_check_pressed(_i, gp_face1);
	jump_key = keyboard_check( vk_space ) || gamepad_button_check(_i, gp_face1);
	dash_key =  keyboard_check( vk_control ) || gamepad_button_check(_i, gp_shoulderl);
	big_attack_key = keyboard_check_pressed( ord("Q") ) || gamepad_button_check_pressed(_i, gp_face3);
	
	// jump buffer
	if jump_key_pressed {
		jump_key_buffer_time = buffer_time;
	}
	
	if jump_key_buffer_time > 0 {
		jump_key_buffered = 1;
		jump_key_buffer_time--;
	} else {
		jump_key_buffered = 0;
	}
	
	// Deadzone
	gamepad_set_axis_deadzone(_i, 0.3);
	
}

function get_menu_controls(_i) {
	start_key = keyboard_check(vk_enter) || gamepad_button_check_pressed(_i, gp_start);
	
	// Deadzone
	gamepad_set_axis_deadzone(_i, 0.45);
}

