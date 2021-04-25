_id = id;
with(other)
{
	if(other._id.CanDamageGolem && CanBeHit)
	{
		hit = true;
		CanBeHit = true;
		alarm[1] = 1.2 * room_speed;
		other._id.CanDamageGolem = false;
		other._id.alarm[1] = 2 * room_speed;
		hp -= 5;
	}
}
