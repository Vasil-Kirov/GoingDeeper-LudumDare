draw_set_color(c_white);
draw_rectangle(x, y, MaxX, MaxY, true);
draw_rectangle(x, y, EndX, EndY, false);
draw_set_color(c_black);
draw_set_font(MenuDefault);
draw_text(x, MaxY + 5, "Volume")