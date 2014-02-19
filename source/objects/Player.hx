package objects;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import states.TextState;

class Player extends FlxSpriteGroup
{
	public var state(get, never):Int;
	
	private var _player:FlxSprite;
	private var _clothHandle:ClothHandle;
	private var _arm:PlayerArm;
	
	private var _state:Int = IDLE;
	private var _fuckedCounter:Int = 0;
	private var _dodgeCounter:Int = 0;
	private var _speed:Float = 1;
	
	inline static public var IDLE:Int = 0;
	inline static public var DODGING:Int = 1;
	inline static public var FUCKED:Int = 2;
	inline static public var GIVEUP:Int = 3;
	
	inline static private var FUCK_COUNTER_START:Int = 100;
	inline static private var DODGE_COUNTER_START:Int = 25;
	
	public function new()
	{
		super( 100, 106 );
		
		drag.x = 100;
		maxVelocity.x = drag.x;
		maxVelocity.y = drag.y;
		
		_player = new FlxSprite();
		_player.loadGraphic("images/player_walk.png", true, true, 60, 60);
		_player.animation.add("idleRight", [0], 10, true);
		_player.animation.add("idleLeft", [5], 10, true);
		_player.animation.add("walkRight", [1,2,0], 10, true);
		_player.animation.add("walkLeft", [4, 3, 5], 10, true);
		_player.animation.add("dodgeRight", [7,7,7,6,6], 2, true);
		_player.animation.add("dodgeLeft", [9, 9, 9, 8, 8], 2, true);
		_player.animation.add("hitRight", [10,12,14,16], 10, true);
		_player.animation.add("hitLeft", [11,13,15,17], 10, true);
		_player.animation.add("giveUp", [18], 2, true);
		_player.facing = FlxObject.RIGHT;
		add( _player );
		
		_clothHandle = new ClothHandle( 0, 20 );
		add( _clothHandle );
		
		trace( _player.x + ", " + _player.y );
		trace( _clothHandle.x + ", " + _clothHandle.y );
		
		_arm = new PlayerArm();
		_arm.visible = false;
		add( _arm );
		Reg.PS.layerFront.add( _arm );
	}
	
	override public function update():Void
	{
		if ( FlxG.keys.justPressed.X && _state != GIVEUP ) {
			_state = GIVEUP;
			Reg.ending = 1;
			FlxTimer.start( 7, fadeGame );
			FlxG.sound.play( "Static" );
		}
		
		switch( _state ) {
			case IDLE:
				if ( FlxG.keys.pressed.LEFT ) {
					x -= _speed * FlxG.timeScale;
					//_player.facing = FlxObject.LEFT;
					_player.animation.play("walkLeft");
				} else if ( FlxG.keys.pressed.RIGHT ) {
					x += _speed * FlxG.timeScale;
					//_player.facing = FlxObject.RIGHT;
					_player.animation.play("walkRight");
				} else {
					if ( _player.facing == FlxObject.LEFT ) {
						_player.animation.play( "idleLeft" );
					} else {
						_player.animation.play( "idleRight" );
					}				
				}								
				
				if ( FlxG.keys.justPressed.SPACE ) {
					_state = DODGING;
					
					if (facing == FlxObject.LEFT)	{
						_arm.x = 14;														
					} else {
						_arm.x = 28;
					}
					
					_arm.y = 9;			
					_arm.visible = true;
					solid = false;
					_dodgeCounter = DODGE_COUNTER_START;
					
					if ( _player.facing == FlxObject.LEFT ) {
						_player.animation.play( "dodgeLeft" );
					} else {
						_player.animation.play( "dodgeRight" );
					}									
				}
			case DODGING:
				if ( FlxG.keys.justPressed.SPACE ) {
					_state = IDLE;
					solid = true;
					_arm.visible = false;
				}
			case FUCKED:
				_arm.visible = false;
				
				if ( _player.facing == FlxObject.LEFT ) {
					_player.animation.play( "hitLeft" );
				} else {
					_player.animation.play( "hitRight" );
				}
				
				if ( _fuckedCounter <= 0 ) {
					_state = IDLE;
					_arm.visible = false;
				} else {
					_fuckedCounter --;
				}
			case GIVEUP:
				Reg.PS.addGlitch();
		}
		
		if ( ( _player.facing == FlxObject.LEFT && _state == IDLE ) 
				|| ( _player.facing == FlxObject.RIGHT && _state == DODGING ) 
				|| ( _player.facing == FlxObject.RIGHT && _state == FUCKED ) )
		{
			_clothHandle.setTopPieceX( x + 6 );
		} else {
			_clothHandle.setTopPieceX( x - 6 + width - 10 );
		}
		
		super.update();
	}
	
	/**
	 * Set the player's current state to idle.
	 */
	public function idle():Void
	{
		_state = IDLE;
	}
	
	/**
	 * Set the player's state to fucked, start the counter, and play the hit sound.
	 */
	public function fuck():Void
	{
		_fuckedCounter = FUCK_COUNTER_START;
		_state = FUCKED;
		FlxG.sound.play( "PlayerHit" );
	}
	
	private function get_state():Int
	{
		return _state;
	}
	
	private function fadeGame( ?t:FlxTimer ):Void
	{
		FlxG.camera.fade( FlxColor.BLACK, 3, false, endGame );
	}
	
	private function endGame():Void
	{
		FlxG.switchState( new TextState() );
	}
}