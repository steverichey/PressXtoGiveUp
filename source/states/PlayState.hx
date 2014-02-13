package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import objects.Bull;
import objects.Player;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _bull:Bull;
	private var _layerBack:FlxGroup;
	private var _layerMiddle:FlxGroup;
	private var _layerFront:FlxGroup;
	private var _title:FlxSprite;
	private var _help:FlxSprite;
	private var _camTarget:FlxSprite;
	
	private var _hideHelp:Bool = false;
	
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
		
		for ( i in 0...100 ) {
			_layerBack.add( new FlxSprite( ( i - 50 ) * 440, -120, "images/arena.png" ) );
		}
		
		_player = new Player();
		_bull = new Bull();
		
		_layerMiddle.add( _bull );
		//_layerMiddle.add( _bull.Legs );
		//_layerMiddle.add( _bull.Head );
		
		_layerFront.add( _player );
		
		_camTarget = new FlxSprite( FlxG.width / 2, FlxG.height / 2 );
		_camTarget.visible = false;
		add( _camTarget );
		
		FlxG.camera.follow( _camTarget, FlxCamera.STYLE_PLATFORMER );
		
		
	}
	
	override public function update():Void
	{
		super.update();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
}