if(alarm[0] <= 0)
{
	if(State == BossState.hover) alarm[0] = 3 * room_speed;
	else alarm[0] = 10 * room_speed;
}

switch(State)
{
	case BossState.hover:
	{
		var PointX = orbit_target.x + lengthdir_x(orbit_length, orbit_place);
		var PointY = orbit_target.y + lengthdir_y(orbit_length, orbit_place);
		move_towards_point(PointX, PointY, orbit_speed);
		orbit_place += orbit_speed; 
	}break;
}