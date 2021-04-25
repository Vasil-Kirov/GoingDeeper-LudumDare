enum PState
{
	idle,
	idleSword,
	run,
	attack,
	jump,
	dead
}

hit = false;
spd = 3;
global.grav = 0.5;
isOnGround = false;
hspd = 0;
vspd = 0;
facing = 1;
AttackQueued = false;
Damage = 3;
hp = 100;
State = PState.idle;
CanBeHit = true;
KnockbackDir = 0;
Knockingback = false;
LastYOnGround = -1;
/* I should be able to remove this but it doesn't work and I dont know and I don't wanna know why */
isAttacking = false;
AlreadyAttacked = false;
isOnLadder = false;

/* Quick hack for jumping animation code */
ReachedJumpAnimEnd = false; 

