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