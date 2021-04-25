facing = sign(oPlayer.x - x); // Get facing direction
image_xscale = facing;

if(alarm[0] <= 0)
{
	if(State == BossState.hover) alarm[0] = 3 * room_speed;
}
if(toSwitch == BossState.attack)
{
	State = BossState.attack;
	toSwitch = -1;
	if(y - oPlayer.y < -10 || y - oPlayer > 10)
	{
		GoingToX = x;
		GoingToY = oPlayer.y
		move_towards_point(GoingToX, GoingToY, orbit_speed);
	}
}
/*
else if(toSwitch == BossState.skill)
{
	State = BossState.skill;
	toSwitch = -1;
}*/
switch(State)
{
	case BossState.hover:
	{
		var PointX = orbit_target.x + lengthdir_x(orbit_length, orbit_place);
		var PointY = orbit_target.y + lengthdir_y(orbit_length, orbit_place);
		if(distance_to_object(oPlayer) > 200)
		{
			PointX = oPlayer.x;
			PointY = oPlayer.y;
		}
		move_towards_point(PointX, PointY, orbit_speed);
		orbit_place += orbit_speed; 
	}break;
	case BossState.attack:
	{
		/* This need to be 20, I don't know why and I just don't care anymore */
		if(distance_to_point(GoingToX, GoingToY) < 20 && !CheckedAttackDist)
		{
			CheckedAttackDist = true;
			AttackingPlayer = true;
			GoingToX = oPlayer.x;
			GoingToY = oPlayer.y;
			move_towards_point(GoingToX, GoingToY, 5);
		}
		if(AttackingPlayer)
		{
			if(sprite_index == sBossAttack) // Check for frames to spawn hitboxes
			{
				if((image_index > 2 && image_index < 5) && !AttackedFirst)
				{
					AttackedFirst = true;
					EnemyAttack(id);
				}
				if((image_index > 9 && image_index < 11 ) && !AttackedSecond)
				{
					AttackedSecond = true;
					EnemyAttack(id);
				}
			}
									/* This need to be 20, I don't know why and I just don't care anymore */
			if(distance_to_point(GoingToX, GoingToY) < 20 && sprite_index != sBossAttack)
			{
				speed = 0;
				sprite_index = sBossAttack;
				image_index = 0;
			}
		}
	}break;
}