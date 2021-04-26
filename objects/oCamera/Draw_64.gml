if(Paused)
{
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	draw_rectangle(0, 0, view_width * 3, view_height * 3, false);
	draw_set_font(PauseFont);
	draw_text(((view_width * 3) / 2)- 72 * 2, ((view_height * 3) / 2) - 72, "PAUSED");
}
if(GameOver)
{
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	draw_rectangle(0, 0, view_width * 3, view_height * 3, false);
	draw_set_font(PauseFont);
	draw_text(((view_width * 3) / 2)- 72 * 3, ((view_height * 3) / 2) - 72, "Game Over");
}
draw_set_alpha(1);

if(instance_exists(oBoss))
{
	draw_healthbar(x-100, y+50, x+(view_width*2), y + 80, oBoss.hp*1.666666666666666666, c_black, c_red, c_lime, 0, true, true)
}