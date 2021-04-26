if(CanBeHit)
{
	hit = true;
	CanBeHit = false;
	alarm[3] = 0.5 * room_speed;
	if(instance_exists(oPlayer))
	{
		hp -= oPlayer.Damage;
	}
}