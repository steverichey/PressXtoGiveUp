package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.motion.LinearMotion;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;

class HospitalState extends FlxState
{
	/**
	 * A sprite containing the hospital graphic.
	 */
	private var _hospitalSprite:FlxSprite;
	
	/**
	 * A group that will hold the roses that are "thrown" on screen.
	 */
	private var _roses:FlxTypedGroup<FlxSprite>;
	
	/**
	 * Only shown if withBull.
	 */
	private var _credits:FlxText;
	
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
		if ( Reg.withBull ) {
			FlxG.cameras.bgColor = 0xffFFFFFF;
		} else {
			FlxG.cameras.bgColor = 0xff000000;
		}
		
		#if !FLX_NO_MOUSE
		FlxG.mouse.hide();
		#end
		
		_hospitalSprite = new FlxSprite( 0, 0 );
		
		if ( Reg.withBull ) {
			_hospitalSprite.loadGraphic( "images/hospital-withbull.png" );
		} else {
			_hospitalSprite.loadGraphic( "images/hospital-withoutbull.png" );
		}
		
		_roses = new FlxTypedGroup<FlxSprite>();
		
		add( _hospitalSprite );
		add( _roses );
		
		FlxG.camera.fade( Reg.withBull ? 0xffFFFFFF : 0xff000000, 10, true );
		
		if ( Reg.withBull ) {
			FlxG.sound.playMusic( "Song", 0.5 );
			
			_credits = new FlxText( 25, 25, 270, "Joon - \t@joonturbo\nMads - \t@pyjamads\nBram - \t@brammichielsen\nRiker - \t@machineers\nJonas\nMusic by Anders Børup\nLogo by Thomas Ryder" );
			_credits.alpha = 0;
			add( _credits );
			
			FlxTween.singleVar( _credits, "alpha", 1, 5 );
		} else {
			FlxG.sound.playMusic( "Hospital", 0.7 );
		}
		
		super.create();
	}
	
	override public function update():Void
	{
		if ( Reg.withBull && FlxRandom.chanceRoll( 10 ) ) {
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
			
			switch ( FlxRandom.chanceRoll( 66 ) ) {
				case true:
					FlxTween.multiVar( rose, { 	x: FlxRandom.floatRanged( 10, FlxG.width - 10 ), 
												y: FlxRandom.floatRanged( FlxG.height - 20, FlxG.height ) },
												time );
				case false:
					var xDest:Float = FlxRandom.floatRanged( 10, FlxG.width - 10 );
					var xHalfDest:Float = ( xDest - rose.x ) / 2;
					
					FlxTween.linearPath( rose, [ 	new FlxPoint( rose.x, rose.y ), 
													new FlxPoint( xHalfDest, FlxRandom.floatRanged( 50, 100 ) ),
													new FlxPoint( xDest, FlxRandom.floatRanged( FlxG.height - 20, FlxG.height ) ) ],
													time );
			}
		}
		
		if ( ( _counter > 500 && FlxG.keys.justPressed.ANY ) || _counter > 1500 ) {
			if ( !_fading ) {
				FlxG.camera.fade( Reg.withBull ? 0xffFFFFFF : 0xff000000, 5, false, onFaded );
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
		_hospitalSprite = null;
		_roses = null;
		
		super.destroy();
	}
}