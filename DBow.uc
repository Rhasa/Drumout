class DBow extends UTWeapon;

defaultproperties
{
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'zGameTest.Mesh.Bow'
		Scale=0.7
	End Object
	PlayerViewOffset=(X=10.0,Y=15,Z=-15.0)
	Mesh=FirstPersonMesh

	WeaponFireSnd[0]=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_FireCue'
	WeaponEquipSnd=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_RaiseCue'
	WeaponPutDownSnd=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_LowerCue'
	PickupSound=SoundCue'A_Pickups.Weapons.Cue.A_Pickup_Weapons_Shock_Cue'

	WeaponFireTypes(0)=EWFT_InstantHit
	WeaponFireTypes(1)=EWFT_None
	
	InstantHitDamage(0)=50

	FireInterval(0)=+0.77
	ShouldFireOnRelease(0)=0

	ShotCost(0)=1
	AmmoCount=42
	MaxAmmoCount=42
}