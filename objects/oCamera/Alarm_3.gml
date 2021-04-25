GameOver = false;
draw_set_alpha(1);
with(oSound)
{
	audio_stop_all();
	instance_destroy();
}
room_goto(0);
instance_destroy();
