_id = id;
with(other)
{
	if(other._id.CanDamagePlayer && CanBeHit)
	{
		hit = true;
		CanBeHit = true;
		alarm[1] = 1.2 * room_speed;
		other._id.CanDamagePlayer = false;
		other._id.alarm[0] = 2 * room_speed;
		hp -= 5;
	}
}
