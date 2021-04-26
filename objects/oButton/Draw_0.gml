draw_self()

if(isResButton)
{
	draw_set_font(CreditsFont);
	if(ResW == 0 && ResH == 0)
	{
		draw_text(x-100, y, "Fullscreen On/Off");
	}
	else
	{
		draw_text(x-20, y, string(ResW) + "x" + string(ResH));
	}
}