randomize(); // Have a different seed every time for differeent ressults from random();
enum BossState
{
	hover,
	skill,
	attack
}
State = BossState.hover;
facing = 1;
toSwitch = BossState.attack;
Damage = 20;
hp = 60;

/* Variables for attack state */ 
GoingToX = 0;
GoingToY = 0;
AttackedFirst = false;
AttackedSecond = false;
AttackingPlayer = false;
CheckedAttackDist = false;

/* Variables for hover state */
orbit_target = oPlayer;
orbit_speed  = 1.5;
orbit_length = 150;
orbit_place  = 0;