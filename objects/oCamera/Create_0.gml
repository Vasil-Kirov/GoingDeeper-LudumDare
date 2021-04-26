#macro view view_camera[0]

view_width  = window_get_width()/3;
view_height = window_get_height()/3;
GameOver = false;

window_scale = 3;
if(view_width < 500) view_width *= 1.5;
if(view_height < 300) view_height *= 1.5;
Paused = false;
CanSwitchPause = true;

alarm[0] = 1;

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);
