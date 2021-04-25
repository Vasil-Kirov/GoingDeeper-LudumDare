enum EState
{
	idle,
	chase,
	returning,
	dead
}
jmp = false;
StartX = x;
State = EState.idle;
spd = .5;
vspd = 0;
hspd = 0;
facing = 1;
hp = 9;
Damage = 20;
hit = false;
CanBeHit = true;
CanAttack = true;
StopMoving = false;

/* Collision checkers */
LastJumpBox = 0;
AlreadyAttacked = false;

/* booleans */
inAirSwitch = false;
isOnGround = false;
isAttacking = false;
