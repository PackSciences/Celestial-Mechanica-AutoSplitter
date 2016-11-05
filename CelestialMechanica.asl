state("CelestialMechanica")
{
	int time : "CelestialMechanica.exe", 0x00593F40;
	settings.Add("autostart_user", default_value = false, description = "Enables the autostart of the run (de-activated by default)", parent = null)
	settings.Add("gametime_user", default_value = true, description = "Enables the game time (uses the game memory) (activated by default)", parent = null)
}
// CelestialMechanica.exe+593F40
init 
{
vars.cinematic = true;
}

reset
{
	if (settings["autostart_user"])
	{
	return (current.time == 27 || vars.cinematic);
	// 27 is strangely the value for menu
	// 45 is the value for cinematic
	}
}

start
{
	if (settings["autostart_user"])
	{
	return (current.time > 45 && vars.cinematic == false);
	}
	
}
update
{
	if (settings["autostart_user"] || settings["gametime_user"])
	{
	if (current.time > 45 && vars.cinematic)
		{
		vars.cinematic = false;
		}
	}
}

split
{
// Didn't found the adress :'(
}

gameTime
{	
	if (settings["gametime_user"])
	{
		print(current.time.ToString());
		if (vars.cinematic == false)
			{
				return TimeSpan.FromMilliseconds(current.time*10);
			}
			// Time is in centiseconds for some reason
	}
}
