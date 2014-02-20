package objects;

import flixel.FlxObject;
import flixel.FlxSprite;

class BullLegs extends FlxSprite
{
	public function new( X:Int, Y:Int )
	{
		super( X, Y );
		
		loadGraphic( "images/bull_legs.png", true, true, 58, 21 );
		animation.add( "run", [0, 1, 2, 3], 12, true );
		animation.add( "idle", [0], 0 );
	}
	
	override public function update()
	{
		if ( Reg.PS.bull.state == Bull.IDLE || Reg.PS.bull.state == Bull.TURNING || Reg.PS.bull.state == Bull.FINISHINFINISHING )
		{
			animation.play( "idle" );
		} else {
			animation.play( "run" );
		}
	}
}