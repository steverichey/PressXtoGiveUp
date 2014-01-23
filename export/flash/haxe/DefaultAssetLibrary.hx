package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("images/arena.png", __ASSET__images_arena_png);
		type.set ("images/arena.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/arena02.png", __ASSET__images_arena02_png);
		type.set ("images/arena02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose01-flagfront.png", __ASSET__images_bf_pose01_flagfront_png);
		type.set ("images/bf-pose01-flagfront.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose01-reference.png", __ASSET__images_bf_pose01_reference_png);
		type.set ("images/bf-pose01-reference.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose02-flagback.png", __ASSET__images_bf_pose02_flagback_png);
		type.set ("images/bf-pose02-flagback.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose02-reference.png", __ASSET__images_bf_pose02_reference_png);
		type.set ("images/bf-pose02-reference.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose03-jump.png", __ASSET__images_bf_pose03_jump_png);
		type.set ("images/bf-pose03-jump.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose03-reference.png", __ASSET__images_bf_pose03_reference_png);
		type.set ("images/bf-pose03-reference.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose04-stab.png", __ASSET__images_bf_pose04_stab_png);
		type.set ("images/bf-pose04-stab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose05-finalstab.png", __ASSET__images_bf_pose05_finalstab_png);
		type.set ("images/bf-pose05-finalstab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose06-hit.png", __ASSET__images_bf_pose06_hit_png);
		type.set ("images/bf-pose06-hit.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bf-pose07-dead.png", __ASSET__images_bf_pose07_dead_png);
		type.set ("images/bf-pose07-dead.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-body.png", __ASSET__images_bull_body_png);
		type.set ("images/bull-body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/Bull-body01.png", __ASSET__images_bull_body01_png);
		type.set ("images/Bull-body01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/Bull-body02.png", __ASSET__images_bull_body02_png);
		type.set ("images/Bull-body02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/Bull-body03.png", __ASSET__images_bull_body03_png);
		type.set ("images/Bull-body03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/Bull-body04.png", __ASSET__images_bull_body04_png);
		type.set ("images/Bull-body04.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/Bull-body05.png", __ASSET__images_bull_body05_png);
		type.set ("images/Bull-body05.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead01.png", __ASSET__images_bull_death_bull_dead01_png);
		type.set ("images/bull-death/Bull-dead01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead02.png", __ASSET__images_bull_death_bull_dead02_png);
		type.set ("images/bull-death/Bull-dead02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead03.png", __ASSET__images_bull_death_bull_dead03_png);
		type.set ("images/bull-death/Bull-dead03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead04.png", __ASSET__images_bull_death_bull_dead04_png);
		type.set ("images/bull-death/Bull-dead04.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead05.png", __ASSET__images_bull_death_bull_dead05_png);
		type.set ("images/bull-death/Bull-dead05.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead06.png", __ASSET__images_bull_death_bull_dead06_png);
		type.set ("images/bull-death/Bull-dead06.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-death/Bull-dead07.png", __ASSET__images_bull_death_bull_dead07_png);
		type.set ("images/bull-death/Bull-dead07.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-head.png", __ASSET__images_bull_head_png);
		type.set ("images/bull-head.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-head02.png", __ASSET__images_bull_head02_png);
		type.set ("images/bull-head02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-head03.png", __ASSET__images_bull_head03_png);
		type.set ("images/bull-head03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-head04.png", __ASSET__images_bull_head04_png);
		type.set ("images/bull-head04.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/Bull-legs.png", __ASSET__images_bull_legs_png);
		type.set ("images/Bull-legs.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/bull-outline.png", __ASSET__images_bull_outline_png);
		type.set ("images/bull-outline.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/clickhere.png", __ASSET__images_clickhere_png);
		type.set ("images/clickhere.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/hospital-scene-withbull.png", __ASSET__images_hospital_scene_withbull_png);
		type.set ("images/hospital-scene-withbull.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/hospitalscene-withoutbull.png", __ASSET__images_hospitalscene_withoutbull_png);
		type.set ("images/hospitalscene-withoutbull.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/PlayerWalk-new.png", __ASSET__images_playerwalk_new_png);
		type.set ("images/PlayerWalk-new.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/quiver-0sticks.png", __ASSET__images_quiver_0sticks_png);
		type.set ("images/quiver-0sticks.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/quiver-1stick.png", __ASSET__images_quiver_1stick_png);
		type.set ("images/quiver-1stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/quiver-2sticks.png", __ASSET__images_quiver_2sticks_png);
		type.set ("images/quiver-2sticks.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/rose01.png", __ASSET__images_rose01_png);
		type.set ("images/rose01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/rose02.png", __ASSET__images_rose02_png);
		type.set ("images/rose02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/rose03.png", __ASSET__images_rose03_png);
		type.set ("images/rose03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/stick01.png", __ASSET__images_stick01_png);
		type.set ("images/stick01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/stick02.png", __ASSET__images_stick02_png);
		type.set ("images/stick02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/stick03.png", __ASSET__images_stick03_png);
		type.set ("images/stick03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("images/stock-photo-688576-hospital-room.png", __ASSET__images_stock_photo_688576_hospital_room_png);
		type.set ("images/stock-photo-688576-hospital-room.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("Applause", __ASSET__assets_sounds_applause_mp3);
		type.set ("Applause", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/console.png", __ASSET__flixel_img_debugger_buttons_console_png);
		type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/drawDebug.png", __ASSET__flixel_img_debugger_buttons_drawdebug_png);
		type.set ("flixel/img/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/logDebug.png", __ASSET__flixel_img_debugger_buttons_logdebug_png);
		type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/open.png", __ASSET__flixel_img_debugger_buttons_open_png);
		type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/pause.png", __ASSET__flixel_img_debugger_buttons_pause_png);
		type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/play.png", __ASSET__flixel_img_debugger_buttons_play_png);
		type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/record_off.png", __ASSET__flixel_img_debugger_buttons_record_off_png);
		type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/record_on.png", __ASSET__flixel_img_debugger_buttons_record_on_png);
		type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/restart.png", __ASSET__flixel_img_debugger_buttons_restart_png);
		type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/statsDebug.png", __ASSET__flixel_img_debugger_buttons_statsdebug_png);
		type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/step.png", __ASSET__flixel_img_debugger_buttons_step_png);
		type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/stop.png", __ASSET__flixel_img_debugger_buttons_stop_png);
		type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/watchDebug.png", __ASSET__flixel_img_debugger_buttons_watchdebug_png);
		type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/flixel.png", __ASSET__flixel_img_debugger_flixel_png);
		type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/windowHandle.png", __ASSET__flixel_img_debugger_windowhandle_png);
		type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/logo/default.png", __ASSET__flixel_img_logo_default_png);
		type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/logo/HaxeFlixel.svg", __ASSET__flixel_img_logo_haxeflixel_svg);
		type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/img/logo/logo.png", __ASSET__flixel_img_logo_logo_png);
		type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/preloader/corners.png", __ASSET__flixel_img_preloader_corners_png);
		type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/preloader/light.png", __ASSET__flixel_img_preloader_light_png);
		type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/tile/autotiles.png", __ASSET__flixel_img_tile_autotiles_png);
		type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/tile/autotiles_alt.png", __ASSET__flixel_img_tile_autotiles_alt_png);
		type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/analog/base.png", __ASSET__flixel_img_ui_analog_base_png);
		type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/analog/thumb.png", __ASSET__flixel_img_ui_analog_thumb_png);
		type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/button.png", __ASSET__flixel_img_ui_button_png);
		type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/cursor.png", __ASSET__flixel_img_ui_cursor_png);
		type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/fontData11pt.png", __ASSET__flixel_img_ui_fontdata11pt_png);
		type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/a.png", __ASSET__flixel_img_ui_virtualpad_a_png);
		type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/b.png", __ASSET__flixel_img_ui_virtualpad_b_png);
		type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/c.png", __ASSET__flixel_img_ui_virtualpad_c_png);
		type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/down.png", __ASSET__flixel_img_ui_virtualpad_down_png);
		type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/left.png", __ASSET__flixel_img_ui_virtualpad_left_png);
		type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/right.png", __ASSET__flixel_img_ui_virtualpad_right_png);
		type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/up.png", __ASSET__flixel_img_ui_virtualpad_up_png);
		type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/x.png", __ASSET__flixel_img_ui_virtualpad_x_png);
		type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/y.png", __ASSET__flixel_img_ui_virtualpad_y_png);
		type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/snd/beep.wav", __ASSET__flixel_snd_beep_wav);
		type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("flixel/snd/flixel.wav", __ASSET__flixel_snd_flixel_wav);
		type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("images/arena.png", "images/arena.png");
		type.set ("images/arena.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/arena02.png", "images/arena02.png");
		type.set ("images/arena02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose01-flagfront.png", "images/bf-pose01-flagfront.png");
		type.set ("images/bf-pose01-flagfront.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose01-reference.png", "images/bf-pose01-reference.png");
		type.set ("images/bf-pose01-reference.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose02-flagback.png", "images/bf-pose02-flagback.png");
		type.set ("images/bf-pose02-flagback.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose02-reference.png", "images/bf-pose02-reference.png");
		type.set ("images/bf-pose02-reference.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose03-jump.png", "images/bf-pose03-jump.png");
		type.set ("images/bf-pose03-jump.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose03-reference.png", "images/bf-pose03-reference.png");
		type.set ("images/bf-pose03-reference.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose04-stab.png", "images/bf-pose04-stab.png");
		type.set ("images/bf-pose04-stab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose05-finalstab.png", "images/bf-pose05-finalstab.png");
		type.set ("images/bf-pose05-finalstab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose06-hit.png", "images/bf-pose06-hit.png");
		type.set ("images/bf-pose06-hit.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bf-pose07-dead.png", "images/bf-pose07-dead.png");
		type.set ("images/bf-pose07-dead.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-body.png", "images/bull-body.png");
		type.set ("images/bull-body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/Bull-body01.png", "images/Bull-body01.png");
		type.set ("images/Bull-body01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/Bull-body02.png", "images/Bull-body02.png");
		type.set ("images/Bull-body02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/Bull-body03.png", "images/Bull-body03.png");
		type.set ("images/Bull-body03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/Bull-body04.png", "images/Bull-body04.png");
		type.set ("images/Bull-body04.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/Bull-body05.png", "images/Bull-body05.png");
		type.set ("images/Bull-body05.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead01.png", "images/bull-death/Bull-dead01.png");
		type.set ("images/bull-death/Bull-dead01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead02.png", "images/bull-death/Bull-dead02.png");
		type.set ("images/bull-death/Bull-dead02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead03.png", "images/bull-death/Bull-dead03.png");
		type.set ("images/bull-death/Bull-dead03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead04.png", "images/bull-death/Bull-dead04.png");
		type.set ("images/bull-death/Bull-dead04.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead05.png", "images/bull-death/Bull-dead05.png");
		type.set ("images/bull-death/Bull-dead05.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead06.png", "images/bull-death/Bull-dead06.png");
		type.set ("images/bull-death/Bull-dead06.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-death/Bull-dead07.png", "images/bull-death/Bull-dead07.png");
		type.set ("images/bull-death/Bull-dead07.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-head.png", "images/bull-head.png");
		type.set ("images/bull-head.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-head02.png", "images/bull-head02.png");
		type.set ("images/bull-head02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-head03.png", "images/bull-head03.png");
		type.set ("images/bull-head03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-head04.png", "images/bull-head04.png");
		type.set ("images/bull-head04.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/Bull-legs.png", "images/Bull-legs.png");
		type.set ("images/Bull-legs.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/bull-outline.png", "images/bull-outline.png");
		type.set ("images/bull-outline.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/clickhere.png", "images/clickhere.png");
		type.set ("images/clickhere.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/hospital-scene-withbull.png", "images/hospital-scene-withbull.png");
		type.set ("images/hospital-scene-withbull.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/hospitalscene-withoutbull.png", "images/hospitalscene-withoutbull.png");
		type.set ("images/hospitalscene-withoutbull.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/PlayerWalk-new.png", "images/PlayerWalk-new.png");
		type.set ("images/PlayerWalk-new.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/quiver-0sticks.png", "images/quiver-0sticks.png");
		type.set ("images/quiver-0sticks.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/quiver-1stick.png", "images/quiver-1stick.png");
		type.set ("images/quiver-1stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/quiver-2sticks.png", "images/quiver-2sticks.png");
		type.set ("images/quiver-2sticks.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/rose01.png", "images/rose01.png");
		type.set ("images/rose01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/rose02.png", "images/rose02.png");
		type.set ("images/rose02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/rose03.png", "images/rose03.png");
		type.set ("images/rose03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/stick01.png", "images/stick01.png");
		type.set ("images/stick01.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/stick02.png", "images/stick02.png");
		type.set ("images/stick02.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/stick03.png", "images/stick03.png");
		type.set ("images/stick03.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("images/stock-photo-688576-hospital-room.png", "images/stock-photo-688576-hospital-room.png");
		type.set ("images/stock-photo-688576-hospital-room.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("Applause", "assets/sounds/applause.mp3");
		type.set ("Applause", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/console.png", "flixel/img/debugger/buttons/console.png");
		type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/drawDebug.png", "flixel/img/debugger/buttons/drawDebug.png");
		type.set ("flixel/img/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/logDebug.png", "flixel/img/debugger/buttons/logDebug.png");
		type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/open.png", "flixel/img/debugger/buttons/open.png");
		type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/pause.png", "flixel/img/debugger/buttons/pause.png");
		type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/play.png", "flixel/img/debugger/buttons/play.png");
		type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/record_off.png", "flixel/img/debugger/buttons/record_off.png");
		type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/record_on.png", "flixel/img/debugger/buttons/record_on.png");
		type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/restart.png", "flixel/img/debugger/buttons/restart.png");
		type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/statsDebug.png", "flixel/img/debugger/buttons/statsDebug.png");
		type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/step.png", "flixel/img/debugger/buttons/step.png");
		type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/stop.png", "flixel/img/debugger/buttons/stop.png");
		type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/watchDebug.png", "flixel/img/debugger/buttons/watchDebug.png");
		type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/flixel.png", "flixel/img/debugger/flixel.png");
		type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/windowHandle.png", "flixel/img/debugger/windowHandle.png");
		type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/logo/default.png", "flixel/img/logo/default.png");
		type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/logo/HaxeFlixel.svg", "flixel/img/logo/HaxeFlixel.svg");
		type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("flixel/img/logo/logo.png", "flixel/img/logo/logo.png");
		type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/preloader/corners.png", "flixel/img/preloader/corners.png");
		type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/preloader/light.png", "flixel/img/preloader/light.png");
		type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/tile/autotiles.png", "flixel/img/tile/autotiles.png");
		type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/tile/autotiles_alt.png", "flixel/img/tile/autotiles_alt.png");
		type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/analog/base.png", "flixel/img/ui/analog/base.png");
		type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/analog/thumb.png", "flixel/img/ui/analog/thumb.png");
		type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/button.png", "flixel/img/ui/button.png");
		type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/cursor.png", "flixel/img/ui/cursor.png");
		type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/fontData11pt.png", "flixel/img/ui/fontData11pt.png");
		type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/a.png", "flixel/img/ui/virtualpad/a.png");
		type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/b.png", "flixel/img/ui/virtualpad/b.png");
		type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/c.png", "flixel/img/ui/virtualpad/c.png");
		type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/down.png", "flixel/img/ui/virtualpad/down.png");
		type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/left.png", "flixel/img/ui/virtualpad/left.png");
		type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/right.png", "flixel/img/ui/virtualpad/right.png");
		type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/up.png", "flixel/img/ui/virtualpad/up.png");
		type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/x.png", "flixel/img/ui/virtualpad/x.png");
		type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/y.png", "flixel/img/ui/virtualpad/y.png");
		type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/snd/beep.wav", "flixel/snd/beep.wav");
		type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("flixel/snd/flixel.wav", "flixel/snd/flixel.wav");
		type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__images_arena_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_arena02_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose01_flagfront_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose01_reference_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose02_flagback_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose02_reference_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose03_jump_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose03_reference_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose04_stab_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose05_finalstab_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose06_hit_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bf_pose07_dead_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_body_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_body01_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_body02_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_body03_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_body04_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_body05_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead01_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead02_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead03_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead04_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead05_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead06_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_death_bull_dead07_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_head_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_head02_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_head03_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_head04_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_legs_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_bull_outline_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_clickhere_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_hospital_scene_withbull_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_hospitalscene_withoutbull_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_playerwalk_new_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_quiver_0sticks_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_quiver_1stick_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_quiver_2sticks_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_rose01_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_rose02_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_rose03_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_stick01_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_stick02_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_stick03_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__images_stock_photo_688576_hospital_room_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sounds_applause_mp3 extends flash.media.Sound { }
class __ASSET__flixel_img_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_drawdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_logdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_statsdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_watchdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_logo_haxeflixel_svg extends flash.utils.ByteArray { }
class __ASSET__flixel_img_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_snd_beep_wav extends flash.media.Sound { }
class __ASSET__flixel_snd_flixel_wav extends flash.media.Sound { }


#elseif html5























































































#end