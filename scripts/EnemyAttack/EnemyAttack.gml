// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyAttack(_id)
{
	with(instance_create_layer(x + 30*facing, y, "Instances", oEnemyHurtBox))
	{
		Creator = _id;
		if(!_id.facing)
		{
			image_xscale = -1;
		}
	}
}