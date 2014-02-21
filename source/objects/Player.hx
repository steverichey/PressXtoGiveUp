package objects;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;

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
		_player.loadGraphic("images/player.png", true, true, 37, 58);
		_player.animation.add("idle", [0], 10, true);
		_player.animation.add("walk", [1, 2, 0], 10, true);
		_player.animation.add("dodge", [3, 3, 3, 4, 4], 2, true);
		_player.animation.add("hit", [5, 6, 7, 8], 10, true);
		
		_player.facing = FlxObject.RIGHT;
		add( _player );
		
		_clothHandle = new ClothHandle( x + 6, y + 20 );
		add( _clothHandle );
		
		_arm = new PlayerArm();
		_arm.visible = false;
		add( _arm );
		Reg.PS.layerFront.add( _arm );
	}
	
	override public function update():Void
	{
		if ( FlxG.keys.justPressed.X && _state != GIVEUP ) {
			_state = GIVEUP;
			Reg.PS.endGame( 1 );
		}
		
		switch( _state ) {
			case IDLE:
				if ( FlxG.keys.pressed.LEFT ) {
					x -= _speed * FlxG.timeScale;
					facing = FlxObject.LEFT;
					_player.animation.play("walk");
				} else if ( FlxG.keys.pressed.RIGHT ) {
					x += _speed * FlxG.timeScale;
					facing = FlxObject.RIGHT;
					_player.animation.play("walk");
				} else {
					_player.animation.play( "idle" );
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
					
					_player.animation.play( "dodge" );
				}
			case DODGING:
				if ( FlxG.keys.justPressed.SPACE ) {
					_state = IDLE;
					solid = true;
					_arm.visible = false;
				}
			case FUCKED:
				_arm.visible = false;
				
				_player.animation.play( "hit" );
				
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
			_clothHandle.setTopPieceX( x + 2 );
		} else {
			_clothHandle.setTopPieceX( x + width - 20 );
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
	
	public function hideArm():Void
	{
		_arm.visible = false; // probably
	}
	
	private function get_state():Int
	{
		return _state;
	}
}