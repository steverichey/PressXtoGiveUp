package objects;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.Vector;
import flash.geom.Rectangle;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;

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
	
	#if flash
	private var _vector:Vector<UInt>;
	#else
	private var _intArray:Array<Int>;
	private var _bitDat:BitmapData;
	private var _altDat:BitmapData;
	private var _matrix:Matrix;
	private var _onStage:Bool = false;
	private var _bitmap:Bitmap;
	#end
	
	public function new()
	{
		super();
		
		_width = rand( FlxG.width );
		_height = rand( 10 );
		
		_rectangle = new Rectangle( rand( FlxG.width ), rand( FlxG.height ) , _width, _height );
		_randomRectangle = generateRandomRectangle();
		
		_dead = FlxRandom.chanceRoll();
		
		#if !flash
		_bitDat = new BitmapData( Std.int( _rectangle.width ), Std.int( _rectangle.height ), false, 0xff00ff00 );
		//_altDat = new BitmapData( Std.int( _randomRectangle.width ), Std.int( _randomRectangle.height ), false, 0xffFF0000 );
		//_matrix = new Matrix( 1, 0, 0, 1, _randomRectangle.x, _randomRectangle.y );
		//_altDat.draw( FlxG.camera.canvas, _matrix );
		//_intArray = _altDat.getVector( _rectangle );
		//_bitDat.setVector( _randomRectangle, _intArray );
		_bitDat.draw( FlxG.camera.canvas, new Matrix( 1, 0, 0, 1, -100, -100 ) );
		_bitmap = new Bitmap( _bitDat );
		_bitmap.x = _rectangle.x;
		_bitmap.y = _rectangle.y;
		#end
		
		//trace( FlxG.camera.canvas.graphics. );
	}
	
	/**
	 * Applies this glitch to the camera.
	 */
	public function execute():Void
	{
		#if flash
		if ( !_dead )
			_randomRectangle = generateRandomRectangle();
		
		_vector = FlxG.camera.buffer.getVector( _randomRectangle );
		FlxG.camera.buffer.setVector( _rectangle, _vector );
		#else
		if ( !_onStage ) {
			FlxG.camera.canvas.addChild( _bitmap );
			_onStage = true;
		} else if ( !_dead ) {
			
		}
		#end
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