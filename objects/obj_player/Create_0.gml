/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



replay = false;
replay_timeline = [];
replay_timeline_index = 0;

come_here_buildup = 0;

come_here_step = function(){
	var _dist = distance_to_object(obj_goal);
	come_here_buildup += 1+(3-_dist/(room_width/2)*3);
	if( come_here_buildup > 240)
	{
		audio_play_sound_at(snd_come_here,x-obj_goal.x,y-obj_goal.y,0,16,room_width,1,false,5,obj_control.play_sound/obj_control.play_sound_max);
		come_here_buildup = 0;
	}
	
}

move_left = function(){
	x -= 1;
	//if(not audio_is_playing(snd_step))
	//	audio_play_sound(snd_step,3,false);
}

move_right = function(){
	x += 1;
	//if(not audio_is_playing(snd_step))
	//	audio_play_sound(snd_step,3,false);
}

move_up = function(){
	y -= 1;
	//if(not audio_is_playing(snd_step))
	//	audio_play_sound(snd_step,3,false);
}

move_down = function(){
	y += 1;
	//if(not audio_is_playing(snd_step))
	//	audio_play_sound(snd_step,3,false);
}

wait = function(){};
