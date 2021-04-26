function BossAttack(_id)
{
	with(instance_create_layer(x + 40*_id.facing, y, "Instances", oBossHurtBox))
	{
		Creator = _id;
		if(!_id.facing)
		{
			image_xscale = -1;
		}
	}
}