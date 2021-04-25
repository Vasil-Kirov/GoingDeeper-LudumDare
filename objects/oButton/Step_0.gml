if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	if(isPlayButton) room_goto_next();
	else if(isSoundTestButton) audio_play_sound(sndSwordAttack, 0, false)
}