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
                animation.add("idle1", [1, 2, 3], 1, true);
                animation.play("idle1");
                setFacingFlip(FlxObject.RIGHT, false, false);
                setFacingFlip(FlxObject.LEFT, true, false);
                setFacingFlip(FlxObject.UP, false, false);
                setFacingFlip(FlxObject.DOWN, false, false);
                animation.add("lr", [1, 2, 3], 1, false);
                animation.add("u", [1, 2, 3], 1, false);
                animation.add("d", [1, 2, 3], 1, false);
                drag.x = drag.y = 1600;
        }
       
        override public function update():Void
        {
                movement();
                super.update();
        }
 private function movement():Void
        {
                var _up:Bool = false;
                var _down:Bool = false;
                var _left:Bool = false;
                var _right:Bool = false;
               
                _up = FlxG.keys.anyPressed(["UP", "W"]);
                _down = FlxG.keys.anyPressed(["DOWN", "S"]);
                _left = FlxG.keys.anyPressed(["LEFT", "A"]);
                _right = FlxG.keys.anyPressed(["RIGHT", "D"]);
               
               
                if (_up && _down)
                        _up = _down = false;
                if (_left && _right)
                        _left = _right = false;
               
                if (_up || _down || _left || _right){
               
               
               
                velocity.x = speed;
                velocity.y = speed;
                       
                var mA:Float = 0; // our temporary angle
 if (_up)  // the player is pressing UP
 {
     mA = -90; // set our angle to -90 (12 o'clock)
     if (_left)
         mA -= 45; // if the player is also pressing LEFT, subtract 45 degrees from our angle - we're moving up and left
     else if (_right)
         mA += 45; // similarly, if the player is pressing RIGHT, add 45 degrees (up and right)
     facing = FlxObject.UP; // the sprite should be facing UP
 }
 else if (_down) // the player is pressing DOWN
 {
     mA = 90; // set our angle to 90 (6 o'clock)
     if (_left)
         mA += 45; // add 45 degrees if the player is also pressing LEFT
     else if (_right)
         mA -= 45; // or subtract 45 if they are pressing RIGHT
     facing = FlxObject.DOWN; // the sprite is facing DOWN
 }
 else if (_left) // if the player is not pressing UP or DOWN, but they are pressing LEFT
 {
     mA = 180; // set our angle to 180 (9 o'clock)
     facing = FlxObject.LEFT; // the sprite should be facing LEFT
 }
 else if (_right) // the player is not pressing UP, DOWN, or LEFT, and they ARE pressing RIGHT
 {
     mA = 0; // set our angle to 0 (3 o'clock)
     facing = FlxObject.RIGHT; // set the sprite's facing to RIGHT
 }
 FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity); // determine our velocity based on angle and speed
 if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) // if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
 {
     switch (facing)
     {
         case FlxObject.LEFT, FlxObject.RIGHT:
             animation.play("lr");
         case FlxObject.UP:
             animation.play("u");
         case FlxObject.DOWN:
             animation.play("d");
     }
 }
        }
        }
       
}