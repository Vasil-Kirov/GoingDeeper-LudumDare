// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAttack(){
	with(instance_create_layer(x + 20*facing, y, "Instances", oHurtBox))
	{
		PlayerCreated = true;
		if(!oPlayer.facing)
		{
			image_xscale = -1;
		}
	}
}