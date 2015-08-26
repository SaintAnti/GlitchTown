package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.tile.FlxTilemap;
/**
 * ...
 * @author conspiracy
 */
class MemeEmoji extends FlxSprite
{	
	public function new(X:Float, Y:Float)
	{
		super(X * 64 + 16, Y * 64 + 16);
		loadGraphic("assets/images/memeface2.png", true, 32, 32);
		animation.add("idle1", [1, 2, 3], 1, true);
		animation.play("idle1");
	}
	
	override public function update():Void
	{
		super.update();
	}
}
