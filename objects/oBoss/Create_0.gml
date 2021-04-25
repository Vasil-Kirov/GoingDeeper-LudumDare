enum BossState
{
	hover,
	skill,
	attack
}

angle = 0;
PlayerMass = 500;
State = BossState.hover;
toSwitch = -1;
orbit_target = oPlayer;
orbit_speed  = 0.5;
orbit_length = 50;
orbit_place  = 0;