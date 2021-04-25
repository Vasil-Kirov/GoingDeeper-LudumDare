if(!Paused)
{
	instance_deactivate_layer("Instances");

	var cam, cleft, ctop, cw, ch;
	cam = view_camera[0];
	cleft	= camera_get_view_x(cam);
	ctop	= camera_get_view_y(cam);
	cw		= camera_get_view_width(cam);
	ch		= camera_get_view_height(cam);

	instance_activate_region(cleft, ctop, cw, ch, true);
}
if(keyboard_check(vk_escape) && CanSwitchPause)
{
	CanSwitchPause = false;
	if(alarm[1] <= 0)
	{
		alarm[1] = .5 * room_speed;
	}
	if(!Paused)
	{
		Paused = true;
		instance_deactivate_all(true);
	}
	else
	{
		instance_activate_all();
		Paused = false;
	}
}