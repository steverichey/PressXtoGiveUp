package;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.OUYAButtonID;
import flixel.input.gamepad.XboxButtonID;

/**
 * Class for abstracting platform-specific input.
 */
class Input
{
	/**
	 * Detect if there is any sort of input (key press, mouse click, touch, or gamepad button).
	 */
	static public var any(get, never):Bool;
	/**
	 * Detect if "X" was just pressed.
	 */
	static public var justX(get, never):Bool;
	/**
	 * Whether or not a gamepad is connected. Always false unless FLX_NO_GAMEPAD is disabled.
	 */
	static public var hasGamepad:Bool = false;
	#if !FLX_NO_GAMEPAD
	/**
	 * A reference to the first active gamepad.
	 */
	static public var gamePad:FlxGamepad;
	#end
	
	static private var pressed:Bool = false;
	
	static private function get_any():Bool
	{
		pressed = false;
		
		// Input detection for a wide variety of platforms.
		
		#if !FLX_NO_MOUSE
		if ( FlxG.mouse.justPressed )
			pressed = true;
		#end
		
		#if !FLX_NO_TOUCH
		if ( FlxG.touches.justStarted().length > 0 )
			pressed = true;
		#end
		
		#if !FLX_NO_KEYBOARD
		if ( FlxG.keys.justPressed.ANY )
			pressed = true;
		#end
		
		#if !FLX_NO_GAMEPAD
		if ( hasGamepad && gamePad.anyButton() )
			pressed = true;
		#end
		
		return pressed;
	}
	
	static private function get_justX():Bool
	{
		pressed = false;
		
		#if !FLX_NO_TOUCH
		if ( FlxG.touches.justStarted().length > 0 )
			pressed = true;
		#end
		
		#if !FLX_NO_KEYBOARD
		if ( FlxG.keys.justPressed.X )
			pressed = true;
		#end
		
		#if !FLX_NO_GAMEPAD
		#if mobile
		if ( hasGamepad && gamePad.justPressed( OUYAButtonID.Y ) )
			pressed = true;
		#else
		if ( hasGamepad && gamePad.justPressed( XboxButtonID.X ) )
			pressed = true;
		#enf=d
		#end
		
		return pressed;
	}
}