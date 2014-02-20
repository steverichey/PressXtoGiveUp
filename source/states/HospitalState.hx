package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.motion.LinearMotion;
import flixel.util.FlxGradient;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;

class HospitalState extends FlxState
{
	/**
	 * A group that will hold the roses that are "thrown" on screen.
	 */
	private var _roses:FlxTypedGroup<FlxSprite>;
	
	/**
	 * Counts up once per frame, determines when fading will/can begin.
	 */
	private var _counter:Int = 0;
	
	/**
	 * Whether or not we are currently fading out.
	 */
	private var _fading:Bool = false;
	
	override public function create():Void
	{
		if ( Reg.ending == 3 ) {
			FlxG.cameras.bgColor = 0xffFFFFFF;
		} else {
			FlxG.cameras.bgColor = 0xff000000;
		}
		
		add( FlxGradient.createGradientFlxSprite( FlxG.width, 161, [ 0xffA2A2A2, 0xffDDDDDD ] ) );
		var floor:FlxSprite = FlxGradient.createGradientFlxSprite( FlxG.width, 39, [ 0xffC7C7C7, 0xffC7C7C7 ] );
		floor.y = 161;
		add( floor );
		
		add( new FlxSprite( 21, 134, "images/bed.png" ) );
		add( new FlxSprite( 187, 68, "images/window.png" ) );
		add( new FlxSprite( 237, 68, "images/window.png" ) );
		
		if ( Reg.ending == 2 ) {
			add( new FlxSprite( 63, 81, "images/painting.png" ) );
		}
		
		if ( Reg.ending == 3 ) {
			add( new FlxSprite( 199, 131, "images/hospibull.png" ) );
		}
		
		_roses = new FlxTypedGroup<FlxSprite>();
		
		add( _roses );
		
		FlxG.camera.fade( ( Reg.ending == 3 ) ? 0xffFFFFFF : 0xff000000, 10, true );
		
		if ( Reg.ending == 3 ) {
			FlxG.sound.playMusic( "Song", 0.5 );
			
			var credits:FlxText = new FlxText( 25, 25, 270, "Joon - \t@joonturbo\nMads - \t@pyjamads\nBram - \t@brammichielsen\nRiker - \t@machineers\nJonas\nMusic by Anders Børup\nLogo by Thomas Ryder\nPort by Steve Richey" );
			credits.alpha = 0;
			add( credits );
			
			FlxTween.singleVar( credits, "alpha", 1, 5 );
		} else {
			FlxG.sound.playMusic( "Hospital", 0.7 );
		}
		
		super.create();
	}
	
	override public function update():Void
	{
		if ( ( Reg.ending == 3 ) && FlxRandom.chanceRoll( 10 ) ) {
			var rose:FlxSprite = null;
			var string:String = "";
			
			switch( FlxRandom.intRanged( 1, 3 ) ) {
				case 1:
					string = "images/rose01.png";
				case 2:
					string = "images/rose02.png";
				case 3:
					string = "images/rose03.png";
			}
			
			switch( FlxRandom.intRanged( 1, 3 ) ) {
				case 1:
					rose = _roses.recycle( FlxSprite, [ FlxRandom.floatRanged( 0, FlxG.width ), FlxG.height, string ] );
				case 2:
					rose = _roses.recycle( FlxSprite, [ -10, FlxRandom.floatRanged( 0, FlxG.height / 2 ), string ] );
				case 3:
					rose = _roses.recycle( FlxSprite, [ FlxG.width, FlxRandom.floatRanged( 0, FlxG.height / 2 ), string ] );
			}
			
			var time:Float = FlxRandom.floatRanged( 1, 1.5 );
			var xDest:Float = FlxRandom.floatRanged( 10, FlxG.width - 10 );
			var xHalfDest:Float = ( rose.x + xDest ) / 2;
			
			FlxTween.quadPath( rose, [ 	new FlxPoint( rose.x, rose.y ), 
										new FlxPoint( xHalfDest, FlxRandom.floatRanged( 50, 100 ) ),
										new FlxPoint( xDest, FlxRandom.floatRanged( FlxG.height - 20, FlxG.height ) ) ],
										time );
		}
		
		if ( ( _counter > 500 && FlxG.keys.justPressed.ANY ) || _counter > 1500 ) {
			if ( !_fading ) {
				FlxG.camera.fade( ( Reg.ending == 3 ) ? 0xffFFFFFF : 0xff000000, 5, false, onFaded );
				_fading = true;
			}
		}
		
		_counter++;
		
		super.update();
	}
	
	private function onFaded():Void
	{
		FlxG.switchState( new PlayState() );
	}
	
	override public function destroy():Void
	{
		_roses.destroy();
		_roses = null;
		
		super.destroy();
	}
}