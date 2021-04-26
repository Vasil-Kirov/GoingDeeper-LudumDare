if(hp <= 0)
{
	if(State != EState.dead)
	{
		State = EState.dead;
		sprite_index = sEnemyDead;
		image_index = 0;
	}
}
else
{
	var hurtbox = instance_place(x, y, oHurtBox)

	if(hurtbox != noone)
	{
		if(CanBeHit && hurtbox.id.PlayerCreated)
		{
			hit = true;
			CanBeHit = false;
			alarm[1] = 1.2 * room_speed;
			hp -= oPlayer.Damage;
		}
	}

	if(isAttacking)
	{
		if((image_index >= 8 || 10 <= image_index) && !AlreadyAttacked)
		{
			AlreadyAttacked = true;
			EnemyAttack(id);
		}
		if(image_index >= 16 || 18 <= image_index)
		{
			isAttacking = false;
			AlreadyAttacked = false;
		}
	}



	image_xscale = facing;
	if(hit && alarm[0] <= 0)
	{
		alarm[0] = 0.8 * room_speed;
	}

	if(instance_exists(oPlayer))
	{
		if(place_meeting(x, y + global.grav, oWall)) isOnGround = true;
		else isOnGround = false;

		if(isOnGround)
		{
			if(inAirSwitch)
			{
				spd -= 2;
				inAirSwitch = false;
				LastJumpBox = 0;
			}
			vspd = 0;
			if(jmp)
			{
				isOnGround = false;
				vspd = -7;
				jmp = false;
				inAirSwitch = true;

			}
		}
		else
		{
			if(vspd < 10)
			{
				vspd += global.grav;
			}
		}

		if(!isAttacking)
		{
			switch(State)
			{
				case EState.idle:
				{
					if(!StopMoving)
					{
						hspd = spd * facing;
						if (sprite_index != sEnemyWalk)
						{
							sprite_index = sEnemyWalk;
							image_index = 0;
						}
					}
					else
					{
						if (sprite_index != sEnemyIdle)
						{
							sprite_index = sEnemyIdle;
							image_index = 0;
						}
						hspd = 0;
					}
					if(alarm[2] <= 0) alarm[2] = 10 * room_speed;
					if(distance_to_object(oPlayer) < 128 && (y - oPlayer.y >= -15 &&  y - oPlayer.y <= 15)) 
					{
						State = EState.chase;
						spd = 1;
					}
				}break;
				case EState.chase:
				{
					if (sprite_index != sEnemyWalk)
					{
						sprite_index = sEnemyWalk;
						image_index = 0;
					}
					if(isOnGround && distance_to_object(oPlayer) < 20 && CanAttack)
					{
						AlreadyAttacked = false;
						CanAttack = false;
						alarm[3] = 3 * room_speed;
						sprite_index = sEnemyAttack;
						image_index = 0;
						isAttacking = true;
					}
		
					if(sign(oPlayer.x - x) != 0)
					{
						facing = sign(oPlayer.x - x);
					}
					hspd = spd * facing;
					if(distance_to_object(oPlayer) > 160)
					{
						State = EState.returning;
						spd = .5;
					}
				}break;
				case EState.returning:
				{
					if (sprite_index != sEnemyWalk)
					{
						sprite_index = sEnemyWalk;
						image_index = 0;
					}
					facing = sign(StartX - x);
					hspd = spd * facing;
					if(StartX - x < 15 && StartX - x > -15) State = EState.idle;
				}break;
			}

			if(place_meeting(x+hspd, y, oWall))
			{
				while(!place_meeting(x+sign(hspd), y, oWall))
				{
					x += sign(hspd);
				}
				hspd = 0;
			}
			if(place_meeting(x, y+vspd, oWall))
			{
				while(!place_meeting(x, y+sign(vspd), oWall))
				{
					y += sign(vspd);
				}
				vspd = 0;
			}
			y += vspd;
			if(distance_to_object(oPlayer) < 20 && isOnGround) hspd = 0;
			x += hspd;
		}
	}
}