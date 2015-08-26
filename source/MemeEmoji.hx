package;
 
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.tile.FlxTilemap;
 
import flixel.util.FlxColor;
import flixel.util.FlxAngle;
 
/**
 * ...
 * @author conspiracy
 */
class MemeEmoji extends FlxSprite
{      
        public var speed:Float = 400;
       
        public function new(X:Float=0, Y:Float=0)
        {
                super(X * 64 + 16, Y * 64 + 16);
                loadGraphic("assets/images/memeface2.png", true, 32, 32);
                animation.add("idle1", [1, 2, 3], 36, true);
                animation.play("idle1");
                setFacingFlip(FlxObject.RIGHT, false, false);
                setFacingFlip(FlxObject.LEFT, true, false);
                setFacingFlip(FlxObject.UP, false, false);
                setFacingFlip(FlxObject.DOWN, false, false);
                animation.add("lr", [1, 2, 3], 36, false);
                animation.add("u", [1, 2, 3], 36, false);
                animation.add("d", [1, 2, 3], 36, false);
                drag.x = drag.y = 1600;
        }
       
        override public function update():Void
        {
                movement();
                super.update();
        }
		private function movement():Void
        {
            if (FlxG.mouse.justPressed)
			{
				x = FlxG.mouse.x - 16;
				y = FlxG.mouse.y - 16;
			}
		}
       
}