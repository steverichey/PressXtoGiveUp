package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.resolution.RatioResolutionPolicy;

class FocusState extends FlxState
{
	private var _clickHere:FlxSprite;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = 0xff000000;
		
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		// Helps prevent resizing bugs
		FlxG.resolutionPolicy = new RatioResolutionPolicy();
		
		_clickHere = new FlxSprite( 0, 0, "images/clickhere.png" );
		add( _clickHere );
		
		super.create();
	}
	
	override public function update():Void
	{
		#if !FLX_NO_MOUSE
		if ( FlxG.mouse.justPressed ) {
			//FlxG.switchState( new PlayState() );
			//FlxG.switchState( new HospitalState() );
			FlxG.switchState( new TextState() );
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