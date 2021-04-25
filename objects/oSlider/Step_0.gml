if(mouse_check_button_pressed(mb_left) && mouse_x >= x && x + MaxX >= mouse_x && mouse_y >= y && mouse_y <= y + MaxY)
{
	isButtonDown = true;
}
if(mouse_check_button_released(mb_left))
{
	isButtonDown = false;
}

if(isButtonDown)
{
	if(mouse_x > MaxX) EndX = MaxX;
	else if(mouse_x < x) EndX = x;
	else EndX = mouse_x;
}


audio_group_set_gain(audiogroup_default, ((EndX - x)* 0.3076923076923077)/100, 0)