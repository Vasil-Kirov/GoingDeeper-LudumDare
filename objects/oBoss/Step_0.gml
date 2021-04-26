if(hp <= 0)
{
	speed = 0;
	hit = false;
	if(State != BossState.dead)
	{
		State = BossState.dead;
		sprite_index = sBossDeath;
		image_index = 0;
		image_speed = 1;
	}
}
else
{
	if(instance_exists(oPlayer))
	{
		if(distance_to_object(oPlayer) > 200) move_towards_point(oPlayer.x, oPlayer.y, 4);
		if(alarm[4] <= 0)
		{
			alarm[4] = 7 * room_speed;
		}
		if(State != BossState.attack) facing = sign(oPlayer.x - x); // Get facing direction
		image_xscale = facing;

		if(hit && alarm[11] <= 0)
		{
			alarm[11] = 0.50 * room_speed;
		}
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

		else if(toSwitch == BossState.skill)
		{
			State = BossState.skill;
			toSwitch = -1;
			if(distance_to_point(x, oPlayer.y) > 20)
			{
				GoingToX = x;
				GoingToY = oPlayer.y;
				move_towards_point(GoingToX, GoingToY, 1);
				// Will maybe have to check for the sprite but I think it should work without it.
			}
		}
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
				if(!oPlayer.isDashing)
				{
					move_towards_point(PointX, PointY, orbit_speed);
					orbit_place += orbit_speed; 
				}
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
							BossAttack(id);
						}
						if((image_index > 9 && image_index < 11 ) && !AttackedSecond)
						{
							AttackedSecond = true;
							BossAttack(id);
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
			case BossState.skill:
			{
				if(GoingToX == 0) GoingToX = x;
				if(GoingToY == 0) GoingToY = oPlayer.y;
				if(place_meeting(x, y, oWall))
				{
					MovingOutOfWall = true;
					move_towards_point(x, oPlayer.y-30, 3)
				}
				else
				{
					if(MovingOutOfWall)
					{
						// Stop moving out of the wall
						if(sprite_index != sBossSkill)
						{
							inPosition = true;
							sprite_index = sBossSkill;
							image_index = 0;
						}
						speed = 0;
					}
					if(distance_to_point(GoingToX, GoingToY) < 20 && !inPosition)
					{
						inPosition = true;
						speed = 0;
						sprite_index = sBossSkill;
						image_index = 0;
					}
					if(sprite_index == sBossSkill && !AlreadyStarted)
					{
						if(image_index > 7 && image_index < 9)
						{
							AlreadyStarted = true;
				
						}
					}
					if(AlreadyStarted)
					{
						if(sprite_index != sBossSkill)
						{
							sprite_index = sBossSkill;
							image_index = 0;
							image_speed = 1;
						}
						speed = 0;
						if(alarm[1] <= 0)
						{
							alarm[1] = 5 * room_speed;
						}
						if(CreateBullet)
						{
							alarm[2] = .75 * room_speed;
							var StandingLeft = true;
							if(x - oPlayer.x > 0)
							{
								StandingLeft = false;
							}
							CreateBullet = false;
				
							var a = 0;
							do
							{
								a = round(random_range(-2, 2)); // trying to randomize the bullets a bit more
							} until(a != 0)
							var CalculatePosition = round(random(11));
							if(CalculatePosition % 2 == 0) // If the number is even we want the bullet to start at left
							{
								if(StandingLeft)
								{
									with(instance_create_layer(x - 150, y + (a * 4) * CalculatePosition, "Instances", oBossBullet))
									{
										direction = point_direction(x, y, oPlayer.x, y);
										speed = 2;
									}
								}
								else
								{
									with(instance_create_layer(oPlayer.x - 250, y + (a * 4) * CalculatePosition, "Instances", oBossBullet))
									{
										direction = point_direction(x, y, oPlayer.x, y);
										speed = 2;
									}
								}
							}
							else // We want the bullet to come from the right side
							{
								if(StandingLeft)
								{
									with(instance_create_layer(oPlayer.x + 250, y + (a * 4) * CalculatePosition, "Instances", oBossBullet))
									{
										image_xscale = -1;
										direction = point_direction(x, y, oPlayer.x, y);
										speed = 2;
									}
								}
								else
								{
									with(instance_create_layer(x + 150, y + (a * 4) * CalculatePosition, "Instances", oBossBullet))
									{
										image_xscale = -1;
										direction = point_direction(x, y, oPlayer.x, y);
										speed = 2;
									}
								}
							}
						}
			
					}
				}
			}break;
		}
	}
}