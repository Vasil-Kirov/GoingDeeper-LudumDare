var coll = instance_place(x + 5 , y, oGolem);
if(coll == noone)
{
	coll = instance_place(x - 5, y, oGolem )
}
if(coll != noone && coll.State != GState.dead)
{
	if(CanDamageGolem && coll.CanBeHit)
	{
		coll.hit = true;
		coll.CanBeHit = false;
		coll.alarm[1] = 1.2 * room_speed;
		CanDamageGolem = false;
		alarm[1] = 2 * room_speed;
		coll.hp -= 5;
	}
}
coll = instance_place(x + 5, y, oPlayer);
if(coll == noone)
{
	coll = instance_place(x - 5, y, oPlayer);
}
if(coll != noone)
{
	if(CanDamagePlayer && coll.CanBeHit)
	{
		coll.hit = true;
		coll.CanBeHit = false;
		coll.alarm[1] = 1.2 * room_speed;
		CanDamagePlayer = false;
		alarm[0] = 2 * room_speed;
		coll.hp -= 5;
		coll.KnockbackDir = point_direction(coll.x, coll.y, x, y);
		coll.Knockingback = true;
		coll.alarm[2] = room_speed * .75;
		coll.hit = true;
		coll.CanBeHit = false;
		if(coll.alarm[1] <= 0)
		{
			coll.alarm[1] = 1.2 * room_speed;
		}
	}
}
