switch(State)
{
	case PState.idle:
	case PState.idleSword:
	{

	}break;
	
	case PState.jump:
	{
		if(!isOnGround)
		{
			State = PState.fall;
			if(sprite_index != sPlayerFall)
			{
				sprite_index = sPlayerFall;
				image_index = 0;
				image_speed = 1;
			}
			ReachedJumpAnimEnd = true; 
		}
	}break;
	
	case PState.run:
	{

	}break;
	
	case PState.attack:
	{
		isAttacking = false;
		State = PState.idleSword;
	}break;
	case PState.dead:
	{
		image_speed = 0;
		image_index = image_number - 1;
		alarm[3] = room_speed * 5;
	}break;
}