if(CanBeHit && other.hp > 0)
{
	KnockbackDir = point_direction(x, y, other.x, other.y);
	Knockingback = true;
	alarm[2] = room_speed * .5;
	hit = true;
	CanBeHit = false;
	if(alarm[1] <= 0)
	{
		alarm[1] = 1.2 * room_speed;
	}
}