if(CanBeHit && !other.PlayerCreated)
{
	KnockbackDir = point_direction(x, y, other.x, other.y);
	Knockingback = true;
	alarm[2] = room_speed * .75;
	hit = true;
	CanBeHit = false;
	if(alarm[1] <= 0)
	{
		alarm[1] = 1.2 * room_speed;
	}

	if(instance_exists(other.Creator))
	{
		hp -= other.Creator.Damage;
	}
}