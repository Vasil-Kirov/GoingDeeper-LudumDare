if(hp <= 0)
{
	if(State != GState.dead)
	{
		State = GState.dead;
		sprite_index = sGolemBreath;
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



	image_xscale = -facing;
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
		switch(State)
		{
			case GState.idle:
			{
				if (sprite_index != sGolemIdle)
				{
					sprite_index = sGolemIdle;
					image_index = 0;
				}
				hspd = 0;
				if(alarm[2] <= 0) alarm[2] = 10 * room_speed;
				if(distance_to_object(oPlayer) < 256) 
				{
					State = GState.chase;
					spd = 3;
				}
			}break;
			case GState.chase:
			{
				if(!CanAttack)
				{
					hspd = 0;
					if(sprite_index != sGolemBreath)
					{
						sprite_index = sGolemBreath;
						image_index = 0;
					}
					if(alarm[3] <= 0)
					{
						alarm[3] = 5 * room_speed;
					}
				}
				else
				{
					if(sprite_index != sGolemRun)
					{
						sprite_index = sGolemRun;
						image_index = 0;
					}
					facing = sign(oPlayer.x - x);
					hspd = spd * facing;
					if(alarm[2] <= 0)
					{
						alarm[2] = 5 * room_speed;
					}
					
				}
				
		
				
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
		x += hspd;
	}
}