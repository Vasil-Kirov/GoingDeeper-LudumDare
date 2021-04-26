if(sprite_index == sBossAttack)
{
	/* Nullating everything */ 
	GoingToX = 0;
	GoingToY = 0;
	CheckedAttackDist	= false;
	AttackingPlayer		= false;
	AttackedFirst		= false;
	AttackedSecond		= false;
	State = BossState.hover;
	sprite_index = sBossIdle;
	image_index = 0;
}
if(sprite_index == sBossDeath)
{
	image_speed = 0;
	image_index = image_number - 1;
	alarm[5] = 3 * room_speed;
}