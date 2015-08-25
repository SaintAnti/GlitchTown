package;

import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author conspiracy
 */
class MemeEmoji extends FlxSprite
{

	public function new(X:Float, Y:Float)
	{
		super(X, Y);
		loadGraphic("assets/images/memeface.png", true, 32, 32);
		animation.add("a", [1, 2, 3, 4, 5, 6], 1, false);
		
	}
	
	
}