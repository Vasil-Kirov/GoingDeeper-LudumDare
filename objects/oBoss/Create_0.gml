randomize(); // Have a different seed every time for differeent ressults from random();
enum BossState
{
	hover,
	attack,
	skill,
	dead
}

LastAttack = BossState.hover;
TimesRepeated = 0;
CanBeHit = true;
hit = false;
State = BossState.hover;
facing = 1;
toSwitch = -1;
Damage = 20;
hp = 60;
GoingToX = 0;
GoingToY = 0;

/* Variables for skill state */ 
AlreadyStarted = false;
Finish = false;
CreateBullet = true;

/* Variables for attack state */ 

AttackedFirst = false;
AttackedSecond = false;
AttackingPlayer = false;
CheckedAttackDist = false;

/* Variables for hover state */
orbit_target = oPlayer;
orbit_speed  = 1.5;
orbit_length = 150;
orbit_place  = 0;