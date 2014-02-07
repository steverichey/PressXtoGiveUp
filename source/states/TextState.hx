package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;

class TextState extends FlxState
{
	private var _text1:FlxText;
	private var _text2:FlxText;
	private var _text3:FlxText;
	private var _text4:FlxText;
	
	private var _fading:Bool = false;
	private var _tweenNum:Int = 0;
	
	override public function create():Void
	{
		if ( Reg.ending == 3 ) {
			FlxG.camera.bgColor = 0xffFFFFFF;
		} else {
			FlxG.camera.bgColor = 0xff000000;
		}
		
		_text1 = new FlxText( FlxG.width / 2 - 125, FlxG.height / 2 - 35, 270 );
		_text2 = new FlxText( FlxG.width / 2 - 125, FlxG.height / 2 - 15, 270 );
		_text3 = new FlxText( FlxG.width / 2 - 125, FlxG.height / 2 + 5, 270 );
		_text4 = new FlxText( FlxG.width / 2 - 125, FlxG.height / 2 + 25, 270 );
		
		_text1.alpha = _text2.alpha = _text3.alpha = _text4.alpha = 0;
		
		_text2.color = 0xff888888;
		
		if ( Reg.ending == 3 ) {
			_text1.color = _text3.color = _text4.color = 0xff000000;
		}
		
		switch( Reg.ending )
		{
			case 1:
				_text1.text = "You lost a fight against a worthy opponent.";
				_text2.text = "Don't worry.";
				_text3.text = "Eventually we all do.";
			case 2:
				_text1.text = "'Ma'am. He didn't make it. The brain tumor--'";
				_text2.text = "'Was he in a lot of distress?'";
				_text3.text = "'...'";
				_text4.text = "'The important thing is his suffering has now ended.'";
			case 3:
				_text1.text = "'Ma'am. I'm calling to inform you that he passed away. The brain tumor finally got the best of him.'";
				_text2.text = "'Was he in a lot of pain?'";
				_text3.text = "'It's hard to imagine what he was experiencing in his state, but he went with great dignity.'";
				_text4.text = "'A true champion until the very end.'";
			default:
				_text1.text = "You Died...";
		}
		
		add( _text1 );
		add( _text2 );
		add( _text3 );
		add( _text4 );
		
		FlxTween.singleVar( _text1, "alpha", 1, 2, { delay: 0.5 } );
		FlxTween.singleVar( _text2, "alpha", 1, 2, { delay: 3.5 } );
		FlxTween.singleVar( _text3, "alpha", 1, 2, { delay: 6.5 } );
		FlxTween.singleVar( _text4, "alpha", 1, 2, { delay: 9.5 } );
		
		FlxTimer.start( 13, beginFade );
		
		super.create();
	}
	
	override public function update():Void
	{
		if ( FlxG.keys.justPressed.ANY ) {
			_text1.alpha = _text2.alpha = _text3.alpha = _text4.alpha = 1;
			
			if ( !_fading ) {
				FlxTimer.start( 1, beginFade );
			}
		}
		
		if ( Reg.ending == 1 ) {
			if ( _text1.alpha >= 1 ) {
				FlxTween.singleVar( _text1, "alpha", 0, 2, { delay: 1 } );
			}
		}
		
		super.update();
	}
	
	private function beginFade( ?f:FlxTimer ):Void
	{
		if ( !_fading ) {
			if ( Reg.ending == 3 ) {
				FlxG.camera.fade( 0xffFFFFFF, 1, endState );
			} else {
				FlxG.camera.fade( 0xff000000, 1, endState );
			}
			
			_fading = true;
		}
	}
	
	private function endState():Void
	{
		switch( Reg.ending ) {
			case 2, 3:
				FlxG.switchState( new HospitalState() );
			default:
				FlxG.switchState( new PlayState() );
		}
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
}