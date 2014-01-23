package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class FocusState extends FlxState
{
	private var _clickHere:FlxSprite;
	
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		_clickHere = new FlxSprite( 0, 0, "images/clickhere.png" );
		
		add( _clickHere );
		
		super.create();
	}
	
	override public function update():Void
	{
		#if !FLX_NO_MOUSE
		if ( FlxG.mouse.justPressed ) {
			FlxG.switchState( new PlayState() );
		}
		#end
		
		super.update();
	}
	
	override public function destroy():Void
	{
		_clickHere = null;
		super.destroy();
	}
}