package objects;

import flixel.FlxSprite;

class Spike extends FlxSprite
{
	private var _idle:Bool = false;
	private var _facingLeft:Bool = false;
	
	public function new( X:Float, Y:Float, Source:String, bull:Bull, FacingLeft:Bool, Idle:Bool = false )
	{
		_idle = Idle;
		
		if ( bull != null ) {
			super( bull.x, bull.y );
		} else {
			super( X, Y );
		}
		
		loadGraphic( Source, true, FacingLeft, 12, 11 );
		
		animation.add( "idleleft", [0] );
		animation.add( "idleright", [1] );
		animation.add( "left", [0,2,4,6,8,10], 5, false );
		animation.add( "right", [1, 3, 5, 7, 9, 11], 5, false );
		
		changeDirection( FacingLeft );
	}
	
	private var changeDirection( Left:Bool ):Void
	{
		if ( _idle ) {
			if ( _facingLeft ) {
				play( "idleleft" );
			} else {
				play( "idleright" );
			}
		} else {
			if ( _facingLeft ) {
				play( "left" );
			} else {
				play( "right" );
			}
		}
	}
}