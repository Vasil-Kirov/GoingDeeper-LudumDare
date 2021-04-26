if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	if(isPlayButton) room_goto_next();
	else if(isSoundTestButton) audio_play_sound(sndSwordAttack, 0, false)
	else if(isResButton)
	{
		if(ResW == 0 && ResH == 0)
		{
			window_set_showborder(!window_get_showborder());
			if(!isFullscreen)
			{
				isFullscreen = true;
				SaveW = surface_get_width(application_surface);
				SaveH = surface_get_height(application_surface);
				window_set_rectangle(0, 0, display_get_width(), display_get_height());
			}
			else
			{
				isFullscreen = false;
				window_set_rectangle((display_get_width() - SaveW) / 2, (display_get_height() - SaveH) / 2, SaveW, SaveH);
				
			}
		}
		else
		{
			if(!isFullscreen) window_set_size(ResW, ResH);
			surface_resize(application_surface, ResW, ResH);
		}
	}
}