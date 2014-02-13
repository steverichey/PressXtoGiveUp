package objects;

import flixel.FlxSprite;

class ClothHandle extends FlxSprite
{
	private var _topPiece:ClothPiece;
	
	inline static private var CLOTH_HEIGHT:Int = 10;
	
	public function new( X:Float, Y:Float )
	{
		super( X, Y );
		visible = false;
		
		Reg.PS.layerFront.add( this );
		
		_topPiece = new ClothPiece( X, Y, 10, CLOTH_HEIGHT, "images/cloth-top.png" );
		var prieviousPiece:ClothPiece = _topPiece;
		
		for ( i in 2...10 ) {
			var nextPiece:ClothPiece = new ClothPiece( X, ( Y + i * ( CLOTH_HEIGHT / 5 ) ), 10, CLOTH_HEIGHT, "images/cloth.png", previousPiece );
			previousPiece = nextPiece;
		}
	}
}