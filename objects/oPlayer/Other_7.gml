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
			image_speed = -1;
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
		EndGame();
	}break;
}