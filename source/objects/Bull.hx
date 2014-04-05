package objects;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;

class Bull extends FlxSpriteGroup
{
	public var state(get, never):Int;
	
	private var _body:FlxSprite;
	private var _head:BullHead;
	private var _legs:BullLegs;
	private var _headBob:FlxTween;
	private var _spikes:FlxTypedGroup<Spike>;
	
	private var _state:Int = IDLE;
	private var _idleDelay:Int = 1000000;
	private var _switchTargetDelay:Int = 30;
	private var _queueLevel:Bool = false;
	private var _level:Int = 0;
	private var _fucked:Bool = false;
	private var _glitchCount:Int = 0;
	private var _doOnce:Bool = false;
	private var _applausePlaying:Bool = false;
	private var _queueLevelAnimCounter:Int = 0;
	
	inline static public var IDLE:Int = 0;
	inline static public var CHARGING:Int = 1;
	inline static public var CHARGELOCKED:Int = 2;
	inline static public var TURNING:Int = 3;
	inline static public var FUCKUPPERFOREVER:Int= 4;
	inline static public var PLAYERDODGED:Int = 5;
	inline static public var FINISHINFINISHING:Int = 6;
	
	inline static private var SPEED:Int = 100;
	inline static private var LOCK_DISTANCE:Int = 100;
	inline static private var BODY_LEFT_X:Int = 13;
	inline static private var BODY_RIGHT_X:Int = 20;
	
	public function new()
	{
		super( 250, 57 );
		
		_body = new FlxSprite( 13, 3 );
		_body.loadGraphic("images/bull_body.png", true, true, 113, 102);
		_body.animation.add("idle0", [0], 0);
		_body.animation.add("idle1", [1], 0);
		_body.animation.add("idle2", [2], 0);
		_body.animation.add("idle3", [3], 0);
		_body.animation.add("idle4", [4], 0);
		
		_body.animation.add("morph2", [0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,1,0,0,1], 20);
		_body.animation.add("morph3", [1,1,1,1,1,2,1,1,1,1,2,1,1,1,2,1,1,2,1,2,1,1,2], 20);
		_body.animation.add("morph4", [2,2,2,2,2,3,2,2,2,2,3,2,2,2,3,2,2,3,2,3,2,2,3], 20);
		_body.animation.add("morph5", [3,3,3,3,3,4,3,3,3,3,4,3,3,3,4,3,3,4,3,4,3,3,4], 20);
		
		add( _body );
		
		drag.x = 200;
		maxVelocity.x = 200;
		maxVelocity.y = 200;
		solid = true;
		
		_head = new BullHead( 7, 56 );
		_legs = new BullLegs( 42, 85 );
		
		add( _head );
		add( _legs );
		
		_headBob = FlxTween.singleVar( _head, "y", _head.y + 3, 1, { type: FlxTween.PINGPONG } );
		
		_spikes = new FlxTypedGroup<Spike>();
	}
	
	override public function update():Void
	{
		if ( _queueLevelAnimCounter <= 0 )
			_body.animation.play( "idle" + _level );
		
		switch ( _state ) {
			case IDLE: 
				if ( _idleDelay <= 0 ) {
					if ( Reg.PS.player.x + Reg.PS.player.width / 2 < x + width / 2 )
					{
						acceleration.x = -SPEED;
						_state = CHARGING;
						_headBob.active = false;
					}
					else if ( Reg.PS.player.x + Reg.PS.player.width / 2 > x + width / 2)
					{
						acceleration.x = SPEED;
						_state = CHARGING;
						_headBob.active = false;
					}
				}
				
				if ( _switchTargetDelay <= 0 ) {
					if ( Reg.PS.player.state == Player.DODGING )
					{
						_head.changeColor( BullHead.GREENEYE );
						_switchTargetDelay = 30;
					}
					else if ( Reg.PS.player.state == Player.IDLE )
					{
						_head.changeColor( BullHead.REDEYE );
						_switchTargetDelay = 30;
					}
				}
				
				_idleDelay--;
				_switchTargetDelay--;
				
				if ( ( Reg.PS.player.x + Reg.PS.player.width / 2 ) - ( x + width / 2 ) > 0 )
				{
					_head.changeHeadPosition( BullHead.HEADRIGHT );
					_body.x = x + BODY_RIGHT_X;
					facing = FlxObject.RIGHT;
				}
				else
				{
					_head.changeHeadPosition( BullHead.HEADLEFT );
					_body.x = x + BODY_LEFT_X;
					facing = FlxObject.LEFT;
				}
			case CHARGING: 
				if ( Math.abs(((Reg.PS.player.x + Reg.PS.player.width / 2) - (x + width / 2))) < LOCK_DISTANCE )
				{
					_state = CHARGELOCKED;
					FlxG.timeScale = 0.1 * ( _level + 1 );
					Audio.addSinging();
					FlxTween.singleVar( FlxG.camera, "zoom", 7, 1 );
					FlxTween.singleVar( Reg.PS.camTarget, "y", 130, 0.5 );
					FlxG.camera.flash( FlxColor.WHITE, 0.1 );
					FlxG.camera.shake( 0.0005, 0.2 );
				}
				
				if ( Reg.PS.player.state == Player.DODGING )
					_head.changeColor( BullHead.GREENEYE );
				else if ( Reg.PS.player.state == Player.IDLE )
					_head.changeColor( BullHead.REDEYE );
				
				doTurn();
			case CHARGELOCKED: 
				if ( Math.abs(((Reg.PS.player.x + Reg.PS.player.width / 2) - (x + width / 2))) < LOCK_DISTANCE - 20 )
				{
					if ( Reg.PS.player.state == Player.IDLE )
					{
						FlxG.timeScale = 1;
						Audio.removeSinging();
						FlxG.camera.flash( 0xffFF0000, 0.5 );
						FlxG.camera.shake( 0.0005, 0.2 );
						_state = FUCKUPPERFOREVER;
						_fucked = true;
					}
					else if ( Reg.PS.player.state == Player.DODGING && _head.eyeState == BullHead.GREENEYE )
					{
						FlxG.timeScale = 1;
						Audio.removeSinging();
						FlxG.camera.flash( 0xffFF0000, 0.5 );
						FlxG.camera.shake( 0.0005, 0.2 );
						_state = FUCKUPPERFOREVER;
						_fucked = true;
					}
					else
					{
						_state = PLAYERDODGED;
					}
				}					
				
				doTurn();
			case FUCKUPPERFOREVER:
				doTurn();
				
				if ( _fucked )
				{
					for ( i in 0..._glitchCount ) 
					{
						Reg.PS.addGlitch();
					}
					
					_glitchCount += 8;
					
					_fucked = false;
					Reg.PS.player.fuck();
				}
				
				if ( Reg.PS.glitches.length > 200 )
				{
					Reg.PS.addGlitch();
					
					if( _doOnce )
					{
						Reg.PS.endGame( 1 );
						_doOnce = false;
					}
					
					_state = FINISHINFINISHING;
				}
			case PLAYERDODGED:
				doTurn();
				
				if ( Math.abs(((Reg.PS.player.x + Reg.PS.player.width / 2) - (x + width / 2))) < 5 )
				{
					FlxG.timeScale = 1;
					Audio.removeSinging();
					Reg.PS.player.idle();
					Reg.PS.player.hideArm();
				}
				
				if ( !_applausePlaying )
				{
					FlxG.sound.play( "Applause" );
					_applausePlaying = true;
				}
			case TURNING: 
				_applausePlaying = false;
				
				if ( velocity.x == 0 )
				{
					if ( _queueLevel )
					{
						if ( (Reg.PS.player.x + Reg.PS.player.width / 2) - (x + width / 2) > 0 )
						{
							_head.changeHeadPosition( BullHead.HEADRIGHT );
							facing = FlxObject.RIGHT;
						}
						else
						{
							_head.changeHeadPosition( BullHead.HEADLEFT );
							facing = FlxObject.LEFT;
						}
						
						FlxG.sound.play( "BullTransform" );
						_queueLevelAnimCounter = 200;
						FlxG.camera.flash( FlxColor.BLACK, 0.1 );
						FlxG.camera.shake( 0.01, 200 / 60 );
						
						FlxTimer.start( 1, flashOnce );
						FlxTimer.start( 2, flashOnce );
						FlxTimer.start( 2.3, flashOnce );
						FlxTimer.start( 2.5, flashOnce );
						FlxTimer.start( 3.5, addAudioLayer );
						
						if ( _level != 4 )
							FlxTween.singleVar( FlxG.camera, "color", 0xff555555, 2 );
						
						_queueLevel = false;
						_level++;
						
						switch( _level ) {
							case 1: _body.animation.play( "morph2" );
							case 2: _body.animation.play( "morph3" );
							case 3: _body.animation.play( "morph4" );
							case 4: _body.animation.play( "morph5" );
							case 5: _state = FINISHINFINISHING;
						}
					}
					
					if ( _queueLevelAnimCounter <= 0)
					{
						FlxG.camera.color = 0xffFFFFFF;
						_head.changeColor();
						_headBob.active = true;
						_state = IDLE;
						
						FlxG.timeScale = 1;
						
						FlxTween.singleVar( FlxG.camera, "zoom", 4, 1 );
						FlxTween.singleVar( Reg.PS.camTarget, "y", FlxG.height / 2, 0.5 );
						Audio.removeSinging();
						
						_idleDelay = 500 - _level * 100;
						
						if ( (Reg.PS.player.x + Reg.PS.player.width / 2) - (x + width / 2) > 0 )
						{
							_head.changeHeadPosition( BullHead.HEADRIGHT );
							facing = FlxObject.RIGHT;
						}
						else
						{
							_head.changeHeadPosition( BullHead.HEADLEFT );
							facing = FlxObject.LEFT;
						}
						
						_spikes.callAll( "changeDirection", [ facing == FlxObject.LEFT ] );
					}
					else
					{
						_queueLevelAnimCounter--;
					}
				}
			case FINISHINFINISHING:
				_body.animation.play( "idle" + _level );
				
				doTurn();
				
				if ( _doOnce )
				{
					FlxTween.singleVar( this, "y", y + 30, 5 );
					FlxTween.singleVar( _legs, "y", _legs.y - 15, 5, { complete: endGame } );
					_doOnce = false;						
				}
		}
		
		super.update();
	}
	
	public function setIdle( Time:Int ):Void
	{
		_idleDelay = Time;
	}
	
	public function addSpike():Void
	{
		var xPos:Float = facing == FlxObject.RIGHT ? Reg.PS.player.x : Reg.PS.player.x + Reg.PS.player.width;
		
		var newSpike:Spike;
		
		if ( facing == FlxObject.LEFT ) {
			newSpike = new Spike( xPos - 13, FlxRandom.floatRanged( 50, 60 ), facing == FlxObject.LEFT, false );
		} else {
			newSpike = new Spike( xPos + 5, FlxRandom.floatRanged( 50, 60 ), facing == FlxObject.LEFT, false );
		}
		
		Reg.PS.layerMiddle.add( newSpike );
		
		_spikes.add( newSpike );
	}
	
	public function levelUp():Void
	{
		_queueLevel = true;
	}
	
	private function doTurn():Void
	{
		if ( Reg.PS.player.x + Reg.PS.player.width / 2 < x + width / 2 && facing == FlxObject.RIGHT )
		{
			acceleration.x = 0;
			_state = TURNING;
		}
		else if ( Reg.PS.player.x + Reg.PS.player.width / 2 > x + width / 2 && facing == FlxObject.LEFT )
		{
			acceleration.x = 0;
			_state = TURNING;
		}
	}
	
	private function flashOnce( ?t:FlxTimer ):Void
	{
		FlxG.camera.flash( FlxColor.BLACK, 0.1 );
	}
	
	private function addAudioLayer( ?t:FlxTimer ):Void
	{
		Audio.addLayer();
	}
	
	private function endGame( ?f:FlxTween ):Void
	{
		Reg.PS.endGame( 2 );
	}
	
	private function get_state():Int
	{
		return _state;
	}
}