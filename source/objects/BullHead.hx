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
	
	public function new( Parent:Bull )
	{
		super( Parent.x, Parent.y );
		loadGraphic( "images/bull-head.png", true, false, 34, 40 );
		
		animation.add("leftRed",   [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0], 10, true);
		animation.add("rightRed",  [7, 7, 7, 7, 7, 7, 7, 7, 6, 5, 4,7, 7, 7, 7, 7, 7,7 , 7, 7], 10, true);
		animation.add("leftGreen", [8, 8, 8, 8, 8, 8, 8, 8, 9, 10, 11,8, 8, 8, 8, 8, 8, 8,8,8], 10, true);
		animation.add("rightGreen",[15,15,15,15,15,15,15,15,14,13, 12, 15, 15, 15, 15, 15, 15, 15, 15, 15], 10, true);
	}
	
	override public function update()
	{
		if ( facing == FlxObject.RIGHT ) {
			if ( eyeState == GREENEYE ) {
				animation.play( "rightGreen" );
			} else {
				animation.play( "rightRed" );
			}
		} else {
			if ( eyeState == GREENEYE ) {
				animation.play( "leftGreen" );
			} else {
				animation.play( "leftRed" );
			}
		}
		
		super.update();
	}
	
	public function changeHeadPosition( Position:Int ):Void
	{
		if ( Position == HEADLEFT ) {
			headState = HEADLEFT;
			//_posToRoot.x = 7;
			facing = FlxObject.LEFT;
		} else {				
			headState = HEADRIGHT;
			//_posToRoot.x = parent.width - 41;
			facing = FlxObject.RIGHT;
		}
	}
	
	public function changeColor( EyeColor:Int = GREENEYE ):Int
	{
		return eyeState = EyeColor;
	}
}