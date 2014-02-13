package objects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class Player extends FlxSpriteGroup
{
	private var _player:FlxSprite;
	private var _clothHandle:ClothHandle;
	private var _arm:PlayerArm;
	
	inline static private var IDLE:Int = 0;
	inline static private var DODGING:Int = 1;
	inline static private var FUCKED:Int = 2;
	inline static private var GIVEUP:Int = 3;
	
	public function new()
	{
		super( 100, 106 );
		
		drag.x = 100;
		maxVelocity.x = drag.x;
		maxVelocity.y = drag.y;
		
		_player = new FlxSprite();
		_player.loadGraphic("images/player_walk.png", true, true, 60, 60);
		_player.animation.add("idleRight", [0], 10, true);
		_player.animation.add("idleLeft", [5], 10, true);
		_player.animation.add("walkRight", [1,2,0], 10, true);
		_player.animation.add("walkLeft", [4, 3, 5], 10, true);
		_player.animation.add("dodgeRight", [7,7,7,6,6], 2, true);
		_player.animation.add("dodgeLeft", [9, 9, 9, 8, 8], 2, true);
		_player.animation.add("hitRight", [10,12,14,16], 10, true);
		_player.animation.add("hitLeft", [11,13,15,17], 10, true);
		_player.animation.add("giveUp", [18], 2, true);
		_player.facing = FlxObject.RIGHT;
		
		_clothHandle = new ClothHandle( x, y + 20 );
		
		_arm = new PlayerArm( this );
		_arm.visible = false;
		add( _arm );
		Reg.PS.layerFront.add( _arm );
	}
}