package objects;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.utils.ByteArray;
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
	private var _vector:Array<Int>;
	private var _bitDat:BitmapData;
	private var _onStage:Bool = false;
	private var _bitmap:Bitmap;
	static private var _commonBitmapData:BitmapData;
	#end
	
	public function new()
	{
		super();
		
		_width = rand( FlxG.width );
		_height = rand( 10 );
		_dead = FlxRandom.chanceRoll();
		
		_randomRectangle = new Rectangle();
		generateRandomRectangle( _randomRectangle );
		
		#if flash
		_rectangle = new Rectangle( rand( FlxG.width ), rand( FlxG.height ) , _width, _height );
		#else
		if ( _commonBitmapData == null )
		{
			_commonBitmapData = new BitmapData( FlxG.width, FlxG.height, false, 0 );
		}
		
		// Stores the current screen image as BitmapData
		_commonBitmapData.draw( FlxG.camera.canvas );
		
		_vector = _commonBitmapData.getVector( _randomRectangle );
		_bitDat = new BitmapData( _width, _height, false, 0 );
		_bitDat.setVector( _bitDat.rect, _vector );
		_bitmap = new Bitmap( _bitDat );
		_bitmap.x = rand( FlxG.width );
		_bitmap.y = rand( FlxG.height );
		#end
	}
	
	/**
	 * Applies this glitch to the camera.
	 */
	public function execute():Void
	{
		#if flash
		if ( !_dead )
		{
			generateRandomRectangle( _randomRectangle );
		}
		
		_vector = FlxG.camera.buffer.getVector( _randomRectangle );
		FlxG.camera.buffer.setVector( _rectangle, _vector );
		#else
		if ( !_onStage )
		{
			FlxG.camera.canvas.addChild( _bitmap, 1 );
			//FlxG.addChildBelowMouse( _bitmap );
			_onStage = true;
		}
		else if ( !_dead )
		{
			generateRandomRectangle( _randomRectangle );
			_vector = _commonBitmapData.getVector( _randomRectangle );
			_bitDat.setVector( _bitDat.rect, _vector );
		}
		#end
	}
	
	/**
	 * Generates a random rectangle.
	 */
	private function generateRandomRectangle( rectangle:Rectangle ):Void
	{
		rectangle.x = rand( FlxG.width - _width );
		rectangle.y = rand( FlxG.height - _height );
		rectangle.width = _width;
		rectangle.height = _height;
	}
	
	/**
	 * Generate a random integer between 0 and Max. Just shorthand for FlxRandom.intRanged
	 */
	inline private function rand( Max:Int ):Int
	{
		return FlxRandom.intRanged( 0, Max );
	}
}