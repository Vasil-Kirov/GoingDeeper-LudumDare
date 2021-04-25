if(CanBeHit && !other.PlayerCreated && instance_exists(other.Creator))
{
	KnockbackDir = point_direction(x, y, other.Creator.x, other.Creator.y);
	Knockingback = true;
	alarm[2] = room_speed * .5;
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