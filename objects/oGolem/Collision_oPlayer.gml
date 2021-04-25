if(State != GState.chase) State = GState.chase;

if(instance_exists(oPlayer) && CanAttack && oPlayer.CanBeHit && !oPlayer.isDashing)
{
	alarm[2] = -1;
	CanAttack = false;
	oPlayer.hp -= 30;
}