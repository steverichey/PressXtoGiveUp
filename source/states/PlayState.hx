package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup.FlxTypedGroup;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import objects.Bull;
import objects.Player;
import objects.Glitch;

class PlayState extends FlxState
{
	public var player(get, never):Player;
	public var bull(get, never):Bull;
	public var camTarget(get, never):FlxSprite;
	public var glitches(get, never):FlxTypedGroup<Glitch>;
	public var layerFront(get, never):FlxGroup;
	public var layerMiddle(get, never):FlxGroup;
	public var layerBack(get, never):FlxGroup;
	
	private var _player:Player;
	private var _bull:Bull;
	private var _layerBack:FlxGroup;
	private var _layerMiddle:FlxGroup;
	private var _layerFront:FlxGroup;
	private var _title:FlxSprite;
	private var _help:FlxSprite;
	private var _camTarget:FlxSprite;
	private var _glitches:FlxTypedGroup<Glitch>;
	
	private var _hideHelp:Bool = false;
	private var _maxX:Int = 0;
	
	override public function create():Void
	{
		super.create();
		
		Reg.PS = this;
		
		FlxG.mouse.visible = false;
		
		if ( FlxG.sound.music != null )
			FlxG.sound.music.stop();
		
		FlxG.camera.bgColor = 0xf1dc9b;
		
		_layerBack = new FlxGroup();
		_layerMiddle = new FlxGroup();
		_layerFront = new FlxGroup();
		
		add( _layerBack );
		add( _layerMiddle );
		add( _layerFront );
		
		for ( i in 0...2000 ) {
			_layerBack.add( new FlxSprite( ( i - 1000 ) * 22, 0, "images/arena.png" ) );
		}
		
		_player = new Player();
		_bull = new Bull();
		
		_layerMiddle.add( _bull );
		_layerFront.add( _player );
		
		_camTarget = new FlxSprite( FlxG.width / 2, FlxG.height / 2 );
		_camTarget.visible = false;
		add( _camTarget );
		
		FlxG.camera.follow( _camTarget, FlxCamera.STYLE_PLATFORMER );
		FlxG.camera.setBounds( 0, 0, 22000, 180, true );
		
		_glitches = new FlxTypedGroup<Glitch>();
		
		#if mobile
		if ( Input.hasGamepad )
			_title = new FlxSprite( 12, -FlxG.height + 72, "images/title_ouya.png" );
		else
			_title = new FlxSprite( 12, -FlxG.height + 72, "images/title.png" );
		#else
		_title = new FlxSprite( 12, -FlxG.height + 72, "images/title.png" );
		#end
		_title.scrollFactor.x = 0;
		_title.scrollFactor.y = 0;
		_layerFront.add( _title );
		
		FlxTween.singleVar( _title, "y", 70, 1 );
		
		FlxG.sound.play( "Intro" );
		
		_help = new FlxSprite( 0, 0, "images/help.png" );
		_help.x = ( FlxG.width - _help.width ) / 2;
		_help.y = FlxG.height - _help.height - 4;
		_help.scrollFactor.x = 0;
		_help.scrollFactor.y = 0;
		_layerFront.add( _help );
	}
	
	override public function update():Void
	{
		super.update();
		
		if ( FlxG.sound.list.length > 0 )
			FlxG.sound.play( "Bass" );
		
		if ( !_hideHelp ) {
			if ( FlxG.keys.pressed.ANY ) {
				removeHelpAndTitle();
				_bull.setIdle( 600 );
				_hideHelp = true;
			}
		}
		
		_camTarget.x = ( _bull.x + _bull.width / 2 + _player.x + _player.width / 2 ) / 2;
	}
	
	override public function draw():Void
	{
		super.draw();
		
		_glitches.callAll( "execute" );
	}
	
	public function endGame( EndType:Int ):Void
	{
		Reg.ending = EndType;
		
		switch ( EndType ) {
			case 1:
				FlxTimer.start( 7, fadeGame );
				FlxG.sound.play( "Static" );
			case 2:
				FlxG.camera.fade( FlxColor.BLACK, 5, false, nextState );
			case 3:
				FlxG.camera.fade( FlxColor.WHITE, 10, false, nextState );
		}
	}
	
	private function fadeGame( ?t:FlxTimer ):Void
	{
		FlxG.camera.fade( FlxColor.BLACK, 3, false, nextState );
	}
	
	private function nextState():Void
	{
		FlxG.switchState( new TextState() );
	}
	
	public function addGlitch():Void
	{
		_glitches.add( new Glitch() );
	}
	
	private function titleOut( ?f:FlxTween ):Void
	{
		FlxTween.singleVar( _title, "y", -_title.height, 1 );
	}
	
	private function removeHelpAndTitle( ?f:FlxTween ):Void
	{
		FlxTween.singleVar( _help, "y", FlxG.height, 0.5 );
		FlxTween.singleVar( _title, "y", _title.y + 40, 1, { complete: titleOut } );
	}
	
	private function get_player():Player
	{
		return _player;
	}
	
	private function get_bull():Bull
	{
		return _bull;
	}
	
	private function get_camTarget():FlxSprite
	{
		return _camTarget;
	}
	
	private function get_glitches():FlxTypedGroup<Glitch>
	{
		return _glitches;
	}
	
	private function get_layerFront():FlxGroup
	{
		return _layerFront;
	}
	
	private function get_layerMiddle():FlxGroup
	{
		return _layerMiddle;
	}
	
	private function get_layerBack():FlxGroup
	{
		return _layerBack;
	}
	
	override public function destroy():Void
	{
		_player.destroy();
		_bull.destroy();
		_layerBack.destroy();
		_layerMiddle.destroy();
		_layerFront.destroy();
		_title.destroy();
		_help.destroy();
		_camTarget.destroy();
		_glitches.destroy();
		
		_player = null;
		_bull = null;
		_layerBack = null;
		_layerMiddle = null;
		_layerFront = null;
		_title = null;
		_help = null;
		_camTarget = null;
		_glitches = null;
		
		super.destroy();
	}
}