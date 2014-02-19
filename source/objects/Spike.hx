package objects;

import flixel.FlxSprite;

class Spike extends FlxSprite
{
	private var _idle:Bool = false;
	
	public function new( X:Float, Y:Float, FacingLeft:Bool, Idle:Bool = false )
	{
		_idle = Idle;
		
		super( X, Y );
		
		loadGraphic( "images/spike.png", true, FacingLeft, 12, 11 );
		
		animation.add( "idleleft", [0] );
		animation.add( "idleright", [1] );
		animation.add( "left", [0,2,4,6,8,10], 5, false );
		animation.add( "right", [1, 3, 5, 7, 9, 11], 5, false );
		
		changeDirection( FacingLeft );
	}
	
	public function changeDirection( Left:Bool ):Void
	{
		if ( _idle ) {
			if ( Left ) {
				animation.play( "idleleft" );
			} else {
				animation.play( "idleright" );
			}
		} else {
			if ( Left ) {
				animation.play( "left" );
			} else {
				animation.play( "right" );
			}
		}
	}
}