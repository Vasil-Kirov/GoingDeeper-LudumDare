if(State == EState.idle && !TriggerCooldown)
{
	TriggerCooldown = true;
	alarm[5] = 2 * room_speed;
	facing *= -1;
}