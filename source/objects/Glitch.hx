package objects;

import flash.Vector;
import flash.geom.Rectangle;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.util.FlxRandom;

/**
 * A glitch object, which applies itself directly to the flixel camera every frame.
 */
class Glitch extends FlxBasic
{
	private var _width:Int = 0;
	private var _height:Int = 0;
	private var _dead:Bool = false;
	private var _rectangle:Rectangle;
	private var _randomRectangle:Rectangle;
	private var _vector:Vector<UInt>;
	
	public function new()
	{
		super();
		
		_width = rand( FlxG.width );
		_height = rand( 10 );
		
		_rectangle = new Rectangle( rand( FlxG.width ), rand( FlxG.height ) , _width, _height );
		_randomRectangle = generateRandomRectangle();
		
		_dead = FlxRandom.chanceRoll();
	}
	
	/**
	 * Applies this glitch to the camera.
	 */
	public function execute():Void
	{
		if ( !_dead )
			_randomRectangle = generateRandomRectangle();
		
		_vector = FlxG.camera.buffer.getVector( _randomRectangle );
		FlxG.camera.buffer.setVector( _rectangle, _vector );
	}
	
	/**
	 * Generates a random rectangle.
	 */
	private function generateRandomRectangle():Rectangle
	{
		return new Rectangle( rand( FlxG.width - _width ), rand( FlxG.height - _height ), _width, _height );
	}
	
	/**
	 * Generate a random integer between 0 and Max. Just shorthand for FlxRandom.intRanged
	 */
	private function rand( Max:Int ):Int
	{
		return FlxRandom.intRanged( 0, Max );
	}
}