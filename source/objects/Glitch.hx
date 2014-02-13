package objects;
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
	private var _hospitalWith:FlxSprite;
	private var _hospitalWithout:FlxSprite;
	
	public function new()
	{
		super();
		
		_x = FlxRandom.intRanged( 0, FlxG.width );
		_y = FlxRandom.intRanged( 0, FlxG.height );
		
		_width = FlxRandom.intRanged( 0, FlxG.width );
		_height = FlxRandom.intRanged( 0, 10 );
		
		_rectangle = new Rectangle( _x, _y, _width, _height );
		_randomRectangle = new Rectangle( FlxRandom.intRanged( 0, Std.int( FlxG.width - _width ) ), FlxRandom.intRanged( 0, Std.int( FlxG.height - _height ) ), _width, _height );
		
		_dead = FlxRandom.chanceRoll();
		_type = FlxRandom.intRanged( 0, 2 );
		
		_hospitalWith = new FlxSprite( 0, 0, "images/hospital-withbull.png" );
		_hospitalWithout = new FlxSprite( 0, 0, "images/hospital-withoutbull.png" );
	}
}