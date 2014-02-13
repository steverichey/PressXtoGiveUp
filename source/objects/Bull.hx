package objects;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class Bull extends FlxSpriteGroup
{
	private var _body:FlxSprite;
	
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
		
		drag.x = 200;
	}
}