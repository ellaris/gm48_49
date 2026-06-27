/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




show_settings = false;
show_settings_anim = 0;

play_sound = true;

draw_menu = function(){	array_foreach(menu_buttons,function(_val,_i) {_val.draw()})}

draw_settings = function(){	array_foreach(settings_buttons,function(_val,_i) {_val.draw(0,_val.ypos*obj_control.show_settings_anim-_val.ypos,1-obj_control.play_sound)})}

toggle_settings = function(){	show_settings = not show_settings;}
toggle_sound = function(){	play_sound = not play_sound;}

ui_button = function(_xpos,_ypos,_icon,_method,_method_args = [],_color = c_silver) constructor{
	xpos = _xpos;
	ypos = _ypos;
	icon = _icon;
	action = _method;
	action_args = _method_args;
	width = 32;
	height = 20;
	
	draw = function(_xoffset = 0,_yoffset = 0,_image=0){
		var _x = room_width*(xpos+_xoffset)-width/2;
		var _y = room_height*(ypos+_yoffset)-height/2;
		
		draw_set_color(c_silver);
		draw_rectangle(_x-width/2,_y-height/2,_x+width/2,_y+height/2,false);
		
		var _hover = point_in_rectangle(mouse_x,mouse_y,_x-width/2,_y-height/2,_x+width/2,_y+height/2);
		if(_hover)
		{
			draw_set_color(c_aqua);
			draw_rectangle(_x-width/2-1,_y-height/2-1,_x+width/2+1,_y+height/2+1,true);
			
			if(mouse_check_button_pressed(mb_left))
				method_call(action,action_args);
		}
		
		draw_sprite(icon,_image,_x,_y);
		
		draw_set_color(c_white);
		
	}
}

menu_buttons = [new ui_button(0.94,0.52,spr_ui_start,room_goto,[rm_level1]),
				//new ui_button(0.94,0.66,spr_ui_options,toggle_settings)
				new ui_button(0.94,0.8,spr_ui_quit,game_end)];
				
settings_button = new ui_button(0.985,0.12,spr_ui_options,toggle_settings)
				
settings_buttons = [new ui_button(0.5,0.15,spr_ui_sound,toggle_sound)];