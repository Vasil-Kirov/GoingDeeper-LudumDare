if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	if(isPlayButton) room_goto_next();
	else if(isSoundTestButton) audio_play_sound(sndSwordAttack, 0, false)
	else if(isResButton)
	{
		if(ResW == 0 && ResH == 0)
		{
			if(window_get_fullscreen()) window_set_fullscreen(false);
			else window_set_fullscreen(true);
		}
		else
		{
			window_set_size(ResW, ResH);
		}
	}
}