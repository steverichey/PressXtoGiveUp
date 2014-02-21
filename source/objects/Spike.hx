package objects;

import flixel.FlxObject;
import flixel.FlxSprite;

class Spike extends FlxSprite
{
	private var _idle:Bool = false;
	
	public function new( X:Float, Y:Float, FacingLeft:Bool, Idle:Bool = false )
	{
		_idle = Idle;
		
		super( X, Y );
		
		loadGraphic( "images/spike.png", true, true, 12, 11 );
		
		animation.add( "idle", [0] );
		animation.add( "bleed", [0, 1, 2, 3, 4, 5], 5, false );
		
		changeDirection( FacingLeft );
	}
	
	public function changeDirection( Left:Bool ):Void
	{
		facing = Left ? FlxObject.LEFT : FlxObject.RIGHT;
		
		if ( _idle ) {
			animation.play( "idle" );
		} else {
			animation.play( "bleed" );
		}
	}
}