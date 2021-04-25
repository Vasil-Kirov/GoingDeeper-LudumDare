if(State = GState.dead)
{
	if(sprite_index == sGolemBreath)
	{
		sprite_index = sGolemHeavyBreath;
		image_index = 0;
		alarm[5] = 5 * room_speed;
	}
}