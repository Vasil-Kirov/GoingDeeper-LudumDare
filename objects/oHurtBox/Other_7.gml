if(!PlayerCreated)
{
	if(instance_exists(Creator)) Creator.isAttacking = false;
}
else
{
	if(instance_exists(oPlayer)) oPlayer.isAttacking = false;
}
instance_destroy();