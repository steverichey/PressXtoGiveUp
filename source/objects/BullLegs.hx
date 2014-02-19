package objects;

import flixel.FlxSprite;

class BullLegs extends FlxSprite
{
	public function new( Parent:Bull )
	{
		super( Parent.x, Parent.y );
		
		loadGraphic( "images/bull_legs.png", true, false, 116, 112 );
		animation.add("runLeft", [0,1,2,3], 12, true);
		animation.add("runRight", [7,6,5,4], 12, true);
		animation.add("idleLeft", [0], 10, true);
		animation.add("idleRight", [7], 10, true);
	}
	
	override public function update()
	{
		if ( Reg.PS.bull.facing == RIGHT ) {
			if ( Reg.PS.bull.state == Bull.IDLE || (parent as Bull).state == Bull.TURNING || (parent as Bull).state == Bull.FINISHINFINISHING)
				{
					play("idleRight");
				}
				else
				{
					play("runRight");
				}
			}
			else
			{
				if ((parent as Bull).state == Bull.IDLE || (parent as Bull).state == Bull.TURNING || (parent as Bull).state == Bull.FINISHINFINISHING)
				{
					play("idleLeft");
				}
				else
				{
					play("runLeft");
				}			
			}
	}
}