/**************************************************************
                   RAGE SWEPs Sound Scripts
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/


if SERVER then return end

/*===============================================================================
                                    Generic
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Generic.Draw",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Generic/Draw.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Generic.IronIn",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Generic/IronIn.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Generic.IronOut",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Generic/IronOut.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Generic.Monocolein",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Generic/Monoclein.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Generic.Monocoleout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Generic/Monocleout.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Pistol
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Pistol.Open",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Pistol/Open.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Pistol.Dump",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Pistol/Dump.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Pistol.Insert",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Pistol/Insert.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Pistol.Close",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Pistol/Close.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Pistol.Click",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Pistol/Click.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Sawed Off
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_SawedOff.Open",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/SawedOff/Open.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_SawedOff.Load",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/SawedOff/Load.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_SawedOff.Close",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/SawedOff/Close.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Rifle
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Rifle.Last",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Rifle/Last.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Rifle.Magout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Rifle/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Rifle.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Rifle/Magin.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Rifle.Slide",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Rifle/Slide.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Shotgun
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Shotgun.Insert",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Shotgun/Insert.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Shotgun.Magout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Shotgun/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Shotgun.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Shotgun/Magin.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Sniper
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Sniper.Bolt",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Sniper/Bolt.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Sniper.Move1",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Sniper/Move1.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Sniper.Move2",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Sniper/Move2.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Sniper.Move3",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Sniper/Move3.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Sniper.Magout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Sniper/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Sniper.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Sniper/Magin.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Machine Gun
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_MachineGun.Open",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/MachineGun/Open.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_MachineGun.Dump",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       =  "RAGE/Weapons/MachineGun/Dump.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_MachineGun.Insert",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/MachineGun/Insert.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_MachineGun.Close",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/MachineGun/Close.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                    Crossbow
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Crossbow.Stringstress",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Crossbow/Stringstress.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Crossbow.Reload",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Crossbow/Reload.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Crossbow.Magout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Crossbow/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Crossbow.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Crossbow/Magin.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Crossbow.Magslap",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Crossbow/Magslap.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                 Rocket Launcher
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_RocketLauncher.Load",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/RocketLauncher/Load.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_RocketLauncher.Aimin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/RocketLauncher/Aimin.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_RocketLauncher.Aimout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/RocketLauncher/Aimout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_RocketLauncher.Magout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/RocketLauncher/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_RocketLauncher.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/RocketLauncher/Magin.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_RocketLauncher.Magslap",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/RocketLauncher/Magslap.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                             Authority Pulse Cannon
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_Cannon.Magout",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Cannon/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Cannon.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Cannon/Magin.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_Cannon.Magready",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/Cannon/Magready.wav"
}
sound.Add(soundData)
//}


/*===============================================================================
                                     Nailgun
===============================================================================*/
//{
local soundData = {
    name        = "Weapon_RAGE_NailGun.Coil",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/Coil.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.Magout",
    channel     = CHAN_USER_BASE+2,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/Magout.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.Magin",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/Magin.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.Reload",
    channel     = CHAN_USER_BASE+2,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/Reload.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.Load",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/Load.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.ModOut",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/ModOut.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.ModIn",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/ModIn.wav"
}
sound.Add(soundData)

local soundData = {
    name        = "Weapon_RAGE_NailGun.Move",
    channel     = CHAN_USER_BASE+2,
    volume      = 0.3,
    soundlevel  = 100,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "RAGE/Weapons/NailGun/Move.wav"
}
sound.Add(soundData)
//}