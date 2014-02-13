package objects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class Player extends FlxSpriteGroup
{
	private var _player:FlxSprite;
	
	public function new()
	{
		super( 100, 106 );
		
		drag.x = 100;
		
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
	}
}