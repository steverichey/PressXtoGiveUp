package objects;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

class PlayerArm extends FlxSprite
{
	private var _readyToAttack:Bool = false;
	private var _inNeutralPosition:Bool = false;
	
	inline static private var ARM_SPEED:Int = 3;
	
	public function new()
	{
		super( 107, 76 );
		loadGraphic( "images/player_arm.png", true, true, 11, 25 );
	}
	
	override public function update()
	{
		facing = Reg.PS.player.facing;
		
		if ( Reg.PS.player.state == Player.DODGING && FlxG.keys.justPressed.DOWN && !_inNeutralPosition )
		{
			FlxTween.singleVar( this, "y", 15, 0.1, { complete: putInSpike } );
			_inNeutralPosition = true;
		}
		else if ( Reg.PS.player.state == Player.DODGING && FlxG.keys.justPressed.UP )
		{
			FlxTween.singleVar( this, "y", 0, 2, { complete: readyToAttack } );
			_inNeutralPosition = false;
		}
		else if ( !FlxG.keys.pressed.UP && !FlxG.keys.pressed.DOWN )
		{
			FlxTween.singleVar( this, "y", 9, 1, { complete: notReadyToAttack } );
		}
		
		super.update();
	}
	
	private function readyToAttack( ?f:FlxTween ):Void
	{
		_readyToAttack = true;
	}
	
	private function notReadyToAttack( ?f:FlxTween ):Void
	{
		_readyToAttack = false;
	}
	
	private function putInSpike( ?f:FlxTween ):Void
	{
		if ( _readyToAttack && Reg.PS.bull.x + 10 < x && x < Reg.PS.bull.x + Reg.PS.bull.width - 20 )
		{
			Reg.PS.bull.addSpike();
			Reg.PS.bull.levelUp();
			FlxG.sound.play( "BullHit" );
		}
		else
		{
			throwStick();
			FlxG.sound.play( "BullMiss" );
		}
		
		Reg.PS.player.idle();
		visible = false;
		
		FlxG.timeScale = 1;
		FlxTween.singleVar( FlxG.camera, "zoom", 4, 1 );
	}
	
	private function throwStick( ?f:FlxTween ):Void
	{
		Reg.PS.layerBack.add( new Spike( x + width / 2, y + 50, Reg.PS.player.facing == FlxObject.LEFT, true ) );
	}
}