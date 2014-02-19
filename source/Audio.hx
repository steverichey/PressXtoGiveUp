package;

import flixel.system.FlxSound;

class Audio
{
	static private var _initialized:Bool = false;
	static private var _level:Int = 0;
	
	static private var _song:FlxSound;
	static private var _trumpet:FlxSound;
	static private var _drumsSnare:FlxSound;
	static private var _bass:FlxSound;
	static private var _bassDrum:FlxSound;
	
	inline static private var SING_IN_TIME:Float = 0.3;
	inline static private var KILL_TIME:Float = 1.3;
	inline static private var LAYER_TIME:Float = 1;
	inline static private var MUTE:Float = 0;
	inline static private var FULL:Float = 1;
	
	/**
	 * Loads sounds and begins looping at zero volume.
	 */
	static public function init():Void
	{
		_song = new FlxSound();
		_song.loadEmbedded( "Song", true );
		_song.volume = 0;
		_song.play();
		
		_trumpet = new FlxSound();
		_trumpet.loadEmbedded( "Trumpet", true );
		_trumpet.volume = 0;
		_trumpet.play();
		
		_drumsSnare = new FlxSound();
		_drumsSnare.loadEmbedded( "DrumsSnare", true );
		_drumsSnare.volume = 0;
		_drumsSnare.play();
		
		_bass = new FlxSound();
		_bass.loadEmbedded( "Bass", true );
		_bass.volume = 0;
		_bass.play();
		
		_bassDrum = new FlxSound();
		_bassDrum.loadEmbedded( "BassDrum", true );
		_bassDrum.volume = 0;
		_bassDrum.play();
		
		_initialized = true;
	}
	
	static public function addLayer():Void
	{
		if ( !_initialized ) init();
		
		_level++;
		
		switch ( _level ) {
			case 1:	
				_song.fadeOut( 			LAYER_TIME, MUTE );
				_trumpet.fadeOut( 		LAYER_TIME, MUTE );
				_drumsSnare.fadeOut( 	LAYER_TIME, MUTE );
				_bass.fadeOut( 			LAYER_TIME, FULL );
				_bassDrum.fadeOut( 		LAYER_TIME, MUTE );
			case 2:
				_song.fadeOut( 			LAYER_TIME, MUTE );
				_trumpet.fadeOut( 		LAYER_TIME, FULL );
				_drumsSnare.fadeOut( 	LAYER_TIME, MUTE );
				_bass.fadeOut( 			LAYER_TIME, FULL );
				_bassDrum.fadeOut( 		LAYER_TIME, MUTE );
			case 3:
				_song.fadeOut( 			LAYER_TIME, MUTE );
				_trumpet.fadeOut( 		LAYER_TIME, MUTE );
				_drumsSnare.fadeOut( 	LAYER_TIME, FULL );
				_bass.fadeOut( 			LAYER_TIME, MUTE );
				_bassDrum.fadeOut( 		LAYER_TIME, FULL );
			case 4:
				_song.fadeOut( 			LAYER_TIME, MUTE );
				_trumpet.fadeOut( 		LAYER_TIME, FULL );
				_drumsSnare.fadeOut( 	LAYER_TIME, FULL );
				_bass.fadeOut( 			LAYER_TIME, FULL );
				_bassDrum.fadeOut( 		LAYER_TIME, FULL );
		}
	}
	
	/**
	 * Fades in singing and bass drum.
	 */
	static public function addSinging():Void
	{
		if ( _initialized ) init();
		
		_song.fadeIn( SING_IN_TIME );
		_bassDrum.fadeIn( SING_IN_TIME );
		_trumpet.fadeOut( SING_IN_TIME );
		_drumsSnare.fadeOut( SING_IN_TIME );
		_bass.fadeOut( SING_IN_TIME );
	}
	
	static public function removeSinging():Void
	{
		_level--;
		addLayer();
	}
	
	static public function reset():Void
	{
		_level = 0;
	}
	
	/**
	 * Fades all sounds to zero volume.
	 */
	static public function killAll():Void
	{
		if ( _initialized ) init();
		
		_song.fadeOut( KILL_TIME );
		_trumpet.fadeOut( KILL_TIME );
		_drumsSnare.fadeOut( KILL_TIME );
		_bass.fadeOut( KILL_TIME );
		_bassDrum.fadeOut( KILL_TIME );
	}
}