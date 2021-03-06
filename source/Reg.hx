package;

import flixel.input.gamepad.FlxGamepad;
import states.PlayState;

/**
 * Storage for global variables.
 */
class Reg
{
	/**
	 * What type of ending the player received.
	 * 1 = Gave up, 2 = Lost, 3 = Won
	 */
	static public var ending:Int = 1;
	/**
	 * A reference to the active playstate.
	 */
	static public var PS:PlayState;
}