toSwitch = round(random(2));
if(toSwitch == LastAttack)
{
	++TimesRepeated
}
else if(toSwitch != 0)
{
	TimesRepeated = 0;
	LastAttack = toSwitch;
}
if(TimesRepeated >= 2)
{
	do
	{
		toSwitch = round(random(2));
	}until(toSwitch != LastAttack)
	LastAttack = toSwitch;
}