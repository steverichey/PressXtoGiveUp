package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.system.scaleModes.RatioScaleMode;

class FocusState extends FlxState
{
	/**
	 * Just a flag to see whether or not a button was pressed this frame.
	 */
	private var _pressed:Bool = false;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = 0xff000000;
		
		// Helps prevent resizing bugs
		
		FlxG.scaleMode = new PixelPerfectScaleMode();
		
		// Detect gamepad status.
		
		#if !FLX_NO_GAMEPAD
		if ( FlxG.gamepads.getFirstActiveGamepad() != null ) {
			Input.gamePad = FlxG.gamepads.getFirstActiveGamepad();
			Input.hasGamepad = true;
		}
		#end
		
		add( new FlxSprite( 0, 0, "images/focus_bg.png" ) );
		
		var here:FlxSprite;
		
		#if mobile
		if ( Input.hasGamepad ) {
			here = new FlxSprite( 0, 0, "images/press_any.png" );
		} else {
			here = new FlxSprite( 0, 0, "images/touch_here.png" );
		}
		#else
		if ( Input.hasGamepad ) {
			here = new FlxSprite( 0, 0, "images/press_any.png" );
		} else {
			here = new FlxSprite( 0, 0, "images/click_here.png" );
		}
		#end
		
		here.x = ( FlxG.width - here.width ) / 2;
		here.y = ( FlxG.height - here.height ) / 2;
		add( here );
		
		// Set up the audio effects.
		
		Audio.init();
		
		super.create();
	}
	
	override public function update():Void
	{
		if ( Input.any )
			FlxG.switchState( new PlayState() );
		
		super.update();
	}
}