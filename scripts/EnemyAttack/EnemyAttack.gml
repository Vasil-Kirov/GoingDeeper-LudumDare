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