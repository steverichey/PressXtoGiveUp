package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.scaleModes.RatioScaleMode;

class FocusState extends FlxState
{
	private var _clickHere:FlxSprite;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = 0xff000000;
		
		// Helps prevent resizing bugs
		FlxG.scaleMode = new RatioScaleMode();
		
		#if mobile
		_clickHere = new FlxSprite( 0, 0, "images/touchhere.png" );
		#else
		_clickHere = new FlxSprite( 0, 0, "images/clickhere.png" );
		#end
		add( _clickHere );
		
		Audio.init();
		
		super.create();
	}
	
	override public function update():Void
	{
		#if !FLX_NO_MOUSE
		if ( FlxG.mouse.justPressed ) {
		#else if !FLX_NO_TOUCH
		if ( FlxG.touches.getFirst() != null ) {
		#end
			FlxG.switchState( new PlayState() );
		}
		
		super.update();
	}
	
	override public function destroy():Void
	{
		_clickHere = null;
		
		super.destroy();
	}
}