package objects;

import flixel.FlxObject;
import flixel.FlxSprite;

class BullLegs extends FlxSprite
{
	public function new( X:Int, Y:Int )
	{
		super( X, Y );
		
		loadGraphic( "images/bull_legs.png", true, false, 116, 112 );
		animation.add("runLeft", [0,1,2,3], 12, true);
		animation.add("runRight", [7,6,5,4], 12, true);
		animation.add("idleLeft", [0], 10, true);
		animation.add("idleRight", [7], 10, true);
	}
	
	override public function update()
	{
		if ( Reg.PS.bull.facing == FlxObject.RIGHT ) {
			if ( Reg.PS.bull.state == Bull.IDLE || Reg.PS.bull.state == Bull.TURNING || Reg.PS.bull.state == Bull.FINISHINFINISHING )
			{
				animation.play( "idleRight" );
			} else {
				animation.play( "runRight" );
			}
		} else {
			if ( Reg.PS.bull.state == Bull.IDLE || Reg.PS.bull.state == Bull.TURNING || Reg.PS.bull.state == Bull.FINISHINFINISHING )
			{
				animation.play( "idleLeft" );
			}
			else
			{
				animation.play( "runLeft" );
			}			
		}
	}
}