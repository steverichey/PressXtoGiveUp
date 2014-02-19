package objects;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class Bull extends FlxSpriteGroup
{
	public var state(get, never):Int;
	
	private var _body:FlxSprite;
	private var _state:Int = IDLE;
	
	inline static public var IDLE:Int = 0;
	inline static public var CHARGING:Int = 1;
	inline static public var CHARGELOCKED:Int = 2;
	inline static public var TURNING:Int = 3;
	inline static public var FUCKUPPERFOREVER:Int= 4;
	inline static public var PLAYERDODGED:Int = 5;
	inline static public var FINISHINFINISHING:Int = 6;
	
	public function new()
	{
		super( 250, 57 );
		
		_body = new FlxSprite();
		_body.loadGraphic("images/bull_body.png", true, false, 116, 112);
		_body.animation.add("left1", [0], 0);
		_body.animation.add("left2", [2], 0);
		_body.animation.add("left3", [4], 0);
		_body.animation.add("left4", [6], 0);
		_body.animation.add("left5", [8], 0);
		
		_body.animation.add("leftMorph2", [0,0,0,0,0,2,0,0,0,0,2,0,0,0,2,0,0,2,0,2,0,0,2], 20);
		_body.animation.add("leftMorph3", [2, 2, 2, 2, 2, 4, 2, 2, 2, 2, 4, 2, 2, 2, 4, 2, 2, 4, 2, 4, 2, 2, 4], 20);
		_body.animation.add("leftMorph4", [4,4,4,4,4,6,4,4,4,4,6,4,4,4,6,4,4,6,4,6,4,4,6], 20);
		_body.animation.add("leftMorph5", [6,6,6,6,6,8,6,6,6,6,8,6,6,6,8,6,6,8,6,8,6,6,8], 20);
		
		_body.animation.add("right1", [1], 0);
		_body.animation.add("right2", [3], 0);
		_body.animation.add("right3", [5], 0);
		_body.animation.add("right4", [7], 0);
		_body.animation.add("right5", [9], 0);
		
		_body.animation.add("rightMorph2", [1,1,1,1,1,3,1,1,1,1,3,1,1,1,3,1,1,3,1,3,1,1,3], 20);
		_body.animation.add("rightMorph3", [3,3,3,3,3,5,3,3,3,3,5,3,3,3,5,3,3,5,3,5,3,3,5], 20);
		_body.animation.add("rightMorph4", [5,5,5,5,5,7,5,5,5,5,7,5,5,5,7,5,5,7,5,7,5,5,7], 20);
		_body.animation.add("rightMorph5", [7,7,7,7,7,9,7,7,7,7,9,7,7,7,9,7,7,9,7,9,7,7,9], 20);
		
		add( _body );
		
		drag.x = 200;
	}
	
	public function setIdle( Time:Float ):Void
	{
		
	}
	
	public function addSpike():Void
	{
		
	}
	
	public function levelUp():Void
	{
		
	}
	
	private function get_state():Int
	{
		return _state;
	}
}