package objects;

import flixel.FlxObject;
import flixel.FlxSprite;

class BullHead extends FlxSprite
{
	public var headState:Int = HEADLEFT;
	public var eyeState:Int = GREENEYE;
	
	inline static public var HEADLEFT:Int = 0;
	inline static public var HEADRIGHT:Int = 1;
	inline static public var REDEYE:Int = 0;
	inline static public var GREENEYE:Int = 1;
	
	public function new( X:Int, Y:Int )
	{
		super( X, Y );
		loadGraphic( "images/bull_head.png", true, true, 31, 24 );
		
		animation.add("red",   [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0], 10, true);
		animation.add("green", [4, 4, 4, 4, 4, 4, 4, 4, 5, 6, 7, 4, 4, 4, 4, 4, 4, 4, 4, 4], 10, true);
	}
	
	override public function update()
	{
		if ( eyeState == GREENEYE )
			animation.play( "green" );
		else
			animation.play( "red" );
		
		super.update();
	}
	
	public function changeHeadPosition( Position:Int ):Void
	{
		if ( Position == HEADLEFT ) {
			headState = HEADLEFT;
			facing = FlxObject.LEFT;
		} else {				
			headState = HEADRIGHT;
			facing = FlxObject.RIGHT;
		}
	}
	
	public function changeColor( EyeColor:Int = GREENEYE ):Int
	{
		return eyeState = EyeColor;
	}
}