class DCrate extends Actor
	HideCategories(Display,Collision,Physics)
	placeable;

var StaticMeshComponent			Mesh;
var MaterialInstanceConstant	MaterialInstance;
var LinearColor					LightColor;
var LinearColor					HitLightColor;


simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	MaterialInstance = Mesh.CreateAndSetMaterialInstanceConstant(0);
	MaterialInstance.SetVectorParameterValue('LightColor', LightColor);
}


simulated function TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum,
			class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	MaterialInstance.SetVectorParameterValue('LightColor', HitLightColor);
	SetTimer(0.5,false,'ResetLight');
}


simulated function ResetLight()
{
	MaterialInstance.SetVectorParameterValue('LightColor', LightColor);
}

defaultproperties
{
	Begin Object class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
		bEnabled=true
		bDynamic=true
	End Object
	Components.Add(MyLightEnvironment)

	Begin Object class=StaticMeshComponent Name=MyStaticMeshComponent
		StaticMesh=StaticMesh'zGameTest.Mesh.SM_Cube'
		Materials[0]=MaterialInstanceConstant'zGameTest.Material.MI_zCrate'
		LightEnvironment=MyLightEnvironment
	End Object
	Mesh=MyStaticMeshComponent
 	Components.Add(MyStaticMeshComponent)
	CollisionComponent=MyStaticMeshComponent

	LightColor=(R=0.5,G=1.0,B=5.0,A=1.0)
	HitLightColor=(R=5.0,G=1.0,B=0.5,A=1.0)
	bEdShouldSnap=true
	bCollideActors=true
	bBlockActors=true
}