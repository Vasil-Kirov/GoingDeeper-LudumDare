// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EndGame()
{
	oCamera.alarm[2] = 1 * room_speed;
	instance_destroy(oPlayer);
}