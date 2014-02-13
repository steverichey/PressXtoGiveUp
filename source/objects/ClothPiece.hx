package objects;

import flixel.FlxSprite;

class ClothPiece extends FlxSprite
{
	public var width(get, never):Float;
	public var height(get, never):Float;
	
	private var _parent:ClothPiece;
	private var _width:Int = 0;
	private var _height:Int = 0;
	private var _minParentX:Float = 0;
	private var _maxParentX:Float = 0;
	private var _minParentY:Float = 0;
	private var _maxParentY:Float = 0;
	private var _xDiff:Float = 0;
	
	inline static private var MIN_PIXEL_OVERLAP:Int = 3;
	
	public function new( X:Float, Y:Float, Width:Int, Height:Int, Source:String, ?Parent:ClothPiece )
	{
		super( X, Y, Source );
		
		_parent = Parent;
		
		Reg.PS.layerMiddle.add( this );
		
		_width = Width;
		_height = Height;
	}
	
	override public function update():Void
	{
		if ( _parent == null )
			return;
		
		_maxParentX = x + ( width - MIN_PIXEL_OVERLAP );
		_minParentX = x - ( _parent.width - MIN_PIXEL_OVERLAP );
		
		_maxParentY = y + ( height - MIN_PIXEL_OVERLAP );
		_minParentY = y - ( _parent.height - MIN_PIXEL_OVERLAP );
		
		if ( _minParentX > _parent.x ) {
			x = _parent.x + ( width - ( MIN_PIXEL_OVERLAP + 1 ) );
		} else if ( parent.x > _maxParentX ) {
			x = _parent.x - ( _parent.Width - ( MIN_PIXEL_OVERLAP + 1 ) );
		} else {
			_xDiff = x - _parent.x;
			
			if ( Math.abs( _xDiff ) >= 1 ) {
				x += ( _xDiff < 0 ) ? 1 * 2: -1 * 2;
			} else if ( Math.abs( _xDiff ) > 0.01 ) {
				x += _xDiff;
			}
		}
		
		if ( _minParentY > _parent.y ) {
			y = _parent.y + ( height - ( MIN_PIXEL_OVERLAP + 1 ) );
		} else if ( _parent.y > maxParentY ) {
			y = _parent.y - ( _parent.height - ( MIN_PIXEL_OVERLAP + 1 ) );
		}
		
		super.update();
	}
	
	private function get_width():Float
	{
		return _width;
	}
	
	private function get_height():Float
	{
		return _height;
	}
}