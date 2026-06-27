/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
var _right = keyboard_check(ord("D")) or keyboard_check(vk_right);
var _up = keyboard_check(ord("W")) or keyboard_check(vk_up);
var _down = keyboard_check(ord("S")) or keyboard_check(vk_down);

if( not replay)
{
	// record and execute movment
	if(_left)
	{
		method_call(move_left,[]);
		array_push(replay_timeline,move_left);
	} else
	if(_right)
	{
		method_call(move_right,[]);
		array_push(replay_timeline,move_right);
	} else
	if(_up)
	{
		method_call(move_up,[]);
		array_push(replay_timeline,move_up);
	} else
	if(_down)
	{
		method_call(move_down,[]);
		array_push(replay_timeline,move_down);
	} else
	{
		array_push(replay_timeline,wait);
	}
	
	come_here_step();
}
else
{
	method_call(replay_timeline[replay_timeline_index],[]);
	replay_timeline_index += 1;
}

var _wall = instance_place(x,y,obj_wall);

if(_wall)
{
	x = xprevious;
	y = yprevious;
	if(not audio_is_playing(snd_wall_hit))
		//audio_play_sound_at(snd_wall_hit,x-_wall.x,y-_wall.y,0,14,room_width,room_width,false,3);
		audio_play_sound_at(snd_wall_hit,(_left-_right)*32,(_down-_up)*32,0,16,33,1,false,3,obj_control.play_sound/obj_control.play_sound_max);
}

//audio_listener_set_position(0,x,y,0);
if(instance_place(x,y,obj_goal))
{
	if(not replay)
	{
		game_set_speed( array_length(replay_timeline) div 5,gamespeed_fps);
		replay = true;
		x = xstart;
		y = ystart;
	}
	else
	{
		game_set_speed(60,gamespeed_fps);
		room_goto(rm_main);
	}
}