var CountLoop = 0;
for(var i = 0; i < hp; i += 10)
{
	draw_sprite(sHeart, 0, CountLoop*32, 10);
	++CountLoop
}
