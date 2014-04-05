package objects;

import flixel.FlxSprite;

class ClothPiece extends FlxSprite
{
	public var clothWidth(default, null):Float = 0;
	public var clothHeight(default, null):Float = 0;
	
	private var _parent:ClothPiece;
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
		
		Reg.PS.layerFront.add( this );
		
		clothWidth = Width;
		clothHeight = Height;
	}
	
	override public function update():Void
	{
		if ( _parent == null )
			return;
		
		_maxParentX = x + ( clothWidth - MIN_PIXEL_OVERLAP );
		_minParentX = x - ( _parent.clothWidth - MIN_PIXEL_OVERLAP );
		
		_maxParentY = y + ( clothHeight - MIN_PIXEL_OVERLAP );
		_minParentY = y - ( _parent.clothHeight - MIN_PIXEL_OVERLAP );
		
		if ( _minParentX > _parent.x ) {
			x = _parent.x + ( clothWidth - ( MIN_PIXEL_OVERLAP + 1 ) );
		} else if ( _parent.x > _maxParentX ) {
			x = _parent.x - ( _parent.clothWidth - ( MIN_PIXEL_OVERLAP + 1 ) );
		} else {
			_xDiff = x - _parent.x;
			
			if ( Math.abs( _xDiff ) >= 1 ) {
				x += ( _xDiff < 0 ) ? 1 * 2: -1 * 2;
			} else if ( Math.abs( _xDiff ) > 0.01 ) {
				x += _xDiff;
			}
		}
		
		if ( _minParentY > _parent.y ) {
			y = _parent.y + ( clothHeight - ( MIN_PIXEL_OVERLAP + 1 ) );
		} else if ( _parent.y > _maxParentY ) {
			y = _parent.y - ( _parent.clothHeight - ( MIN_PIXEL_OVERLAP + 1 ) );
		}
		
		super.update();
	}
}