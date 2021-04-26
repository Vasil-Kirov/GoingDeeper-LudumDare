enum GState
{
	idle,
	walk,
	chase,
	dead
}

LastJumpBox = -1;
hspd = 0;
vspd = 0;
CanAttack = true;
isOnGround = false;
State = GState.idle;
hp = 30;
facing = 1;
hit = false;
inAirSwitch = false;
jmp = false;
CanBeHit = true