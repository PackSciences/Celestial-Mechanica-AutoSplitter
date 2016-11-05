state("CelestialMechanica")
{
	int time : "CelestialMechanica.exe", 0x00593F40;
}
// CelestialMechanica.exe+593F40
init 
{
vars.cinematic = true;
}

reset
{
	//return (current.time == 27 || vars.cinematic);
	// 27 is strangely the value for menu
	// 45 is the value for cinematic
	// Edit : Removed
}

start
{
	//return (current.time > 45 && vars.cinematic == false);
	// Edit: Removed
}
update
{
if (current.time > 45 && vars.cinematic)
	vars.cinematic = false;
}

split
{
// Didn't found the adress :'(
}

gameTime
{	
	print(current.time.ToString());
	if (vars.cinematic == false)
			return TimeSpan.FromMilliseconds(current.time);
}
