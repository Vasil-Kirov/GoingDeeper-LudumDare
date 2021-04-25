#macro view view_camera[0]

view_width  = 1600/3;
view_height = 900/3;
GameOver = false;

window_scale = 3;
Paused = false;
CanSwitchPause = true;

window_set_size(view_width*window_scale, view_height*window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);
