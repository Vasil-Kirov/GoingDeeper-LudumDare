/* Check if the player is dead */
if(hp <= 0)
{
	oPlayer.State = PState.dead;
}
if(Knockingback)
{
	x -= lengthdir_x(1, KnockbackDir);
}
if(State != PState.jump) image_speed = 1;

if (hit && alarm[0] <= 0) {
   alarm[0] = .8 * room_speed; // Flashes for 0.8 seconds before turning back to normal
}

/* Make sprite face the correct direction */
image_xscale = facing;

/* Get keyboard input */
var up = keyboard_check(vk_up) || keyboard_check(ord("W")) || keyboard_check(vk_space);
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));

/* Check if character is on the ground */ 
if(!Knockingback)
{
	isOnLadder = place_meeting(x, y, oLadder);
	if(State != PState.attack)
	{
		if(place_meeting(x, y + global.grav, oWall))
		{
			isOnGround = true;
			if(ReachedJumpAnimEnd)
			{
				ReachedJumpAnimEnd = false;
			}
			if(AttackQueued && !isAttacking)
			{
				oPlayer.State = PState.attack;
				oPlayer.isAttacking = true;
				AttackQueued = false;
			}
		}
		else
		{
			if(vspd < 10 && !isOnLadder)
			{
				vspd += global.grav;
			}
			isOnGround = false;
		}

		/* Get which direction the character is facing */
		if(right) facing = 1;
		else if(left)
		{
			facing = -1;
		}
		if(isOnGround)
		{
			if(LastYOnGround != -1)
			{
				var FallDamage = (y - LastYOnGround) / 15;
				if(FallDamage > 10)
				{
					hp -= round(FallDamage);
				}
			}
			LastYOnGround = y;
			vspd = 0;
			if(up && !isOnLadder)
			{
				State = PState.jump;
				isOnGround = false;
				vspd = -7
			}
		}
		if(isOnLadder)
		{
			LastYOnGround = y;
			var down = keyboard_check(vk_down) || keyboard_check(ord("S"));
			vspd = (down * spd) - (up * spd);
		} 
		hspd = (right * spd) - (left * spd);
	}

	switch(State)
	{
		case PState.idle:
		case PState.idleSword:
		{
			if(sprite_index != sPlayer && sprite_index != sPlayerIdleSword)
			{
				if(State == PState.idle)
				{
					sprite_index = sPlayer;
					image_index = 0;
				}
				else
				{
					sprite_index = sPlayerIdleSword;
					image_index = 0;
				}
			}

			if(left || right)
			{
				State = PState.run;
			}
			if(mouse_check_button(mb_left) && !isAttacking)
			{
						oPlayer.State = PState.attack;
						oPlayer.isAttacking = true;
			}
		}break;
	
		case PState.jump:
		{
			if(image_index > 0 && image_index < 2)
			{
				if(ReachedJumpAnimEnd) image_speed = 0;
				else image_speed = 1;
			}
			if(sprite_index != sPlayerJump)
			{
				sprite_index = sPlayerJump;
				image_index = 0;
			}
			if(isOnGround) State = PState.idle;
			if(mouse_check_button(mb_left) && !isAttacking)
			{
				AttackQueued = true;
			}
		}break;
	
		case PState.run:
		{
			if(sprite_index != sPlayerRun) sprite_index = sPlayerRun;
			if(!left && !right)
			{
				State = PState.idle;
			}
			if(mouse_check_button(mb_left) && !isAttacking)
			{
				oPlayer.State = PState.attack;
				oPlayer.isAttacking = true;
			}
		}break;
	
		case PState.attack:
		{
			if(sprite_index != sPlayerAttack)
			{
				sprite_index = sPlayerAttack;
				image_index = 0;
			}
			if(image_index >= 3 && image_index <= 5 && !AlreadyAttacked)
			{
				AlreadyAttacked = true;
				PlayerAttack();
			}
			if(image_index > 4)
			{
				AlreadyAttacked = false;
			}
		}break;
	}
	if(State != PState.attack)
	{	
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

		x += hspd;
		y += vspd;
	}
}