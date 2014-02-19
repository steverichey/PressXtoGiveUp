package objects;

import flash.Vector;
import flash.geom.Rectangle;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxRandom;

class Glitch extends FlxBasic
{
	private var _x:Float = 0;
	private var _y:Float = 0;
	private var _width:Float = 0;
	private var _height:Float = 0;
	private var _dead:Bool = false;
	private var _once:Bool = false;
	private var _type:Int = 0;
	private var _rectangle:Rectangle;
	private var _randomRectangle:Rectangle;
	private var _hospitalWithout:FlxSprite;
	private var _vector:Vector<UInt>;
	
	public function new()
	{
		super();
		
		_x = FlxRandom.intRanged( 0, FlxG.width );
		_y = FlxRandom.intRanged( 0, FlxG.height );
		
		_width = FlxRandom.intRanged( 0, FlxG.width );
		_height = FlxRandom.intRanged( 0, 10 );
		
		_rectangle = new Rectangle( _x, _y, _width, _height );
		generateRandomRectangle();
		
		_dead = FlxRandom.chanceRoll();
		_type = FlxRandom.intRanged( 0, 2 );
		
		_hospitalWithout = new FlxSprite( 0, 0, "images/hospital_without.png" );
	}
	
	public function execute():Void
	{
		switch( _type ) {
			case 0:
				if ( !_dead )
					generateRandomRectangle();
				_vector = FlxG.camera.buffer.getVector( _randomRectangle );
				FlxG.camera.buffer.setVector( _rectangle, _vector );
				_once = true;
			case 1:
				_vector = _hospitalWithout.framePixels.getVector( _randomRectangle );
				FlxG.camera.buffer.setVector( _rectangle, _vector );
			case 2:
				_vector = _hospitalWithout.framePixels.getVector( _rectangle );
				FlxG.camera.buffer.setVector( _rectangle, _vector );
		}
	}
	
	private function generateRandomRectangle():Void
	{
		_randomRectangle = new Rectangle( FlxRandom.intRanged( 0, Std.int( FlxG.width - _width ) ), FlxRandom.intRanged( 0, Std.int( FlxG.height - _height ) ), _width, _height );
	}
}