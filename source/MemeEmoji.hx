package;
 
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.tile.FlxTilemap;
 
import flixel.util.FlxColor;
import flixel.util.FlxAngle;
 
/**
 * @author conspiracy
 */

class MemeEmoji extends FlxSprite
{      
        public var speed:Float = 5;
		public var moving:Bool = false;
		
		var x_speed:Float = 0;
		var y_speed:Float = 0;
		var waypoint_x:Float = FlxG.mouse.x - 16;
		var waypoint_y:Float = FlxG.mouse.y - 16;
		
		var dist_x:Float = 0;
		var dist_y:Float = 0;
		var dist_total:Float = 0;
		
       
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
		public function movement():Void
        {	
            if (FlxG.mouse.justPressed)
			{
				x += 1;
				y += 1;
				//sets current mouse co-ordinates as waypoint
				waypoint_x= FlxG.mouse.x - 16;
				waypoint_y = FlxG.mouse.y - 16;
				
				//calculates the x and y distances between player and mouse
				dist_x = waypoint_x - x;
				dist_y = waypoint_y - y;
				dist_total = Math.sqrt(dist_x * dist_x + dist_y * dist_y);
				
				//Pythagoras' theorem, bitch
				x_speed = speed * dist_x / dist_total;
				y_speed = speed * dist_y / dist_total;
				
				//set moving to true, so that face starts moving
				moving = true;
			}
			
			if (moving == true) 
			{
				
				x += x_speed;
				y += y_speed;
				
				if (Math.abs(x - waypoint_x) <= x_speed || Math.abs(y - waypoint_y) <= y_speed) 
				{
					x = waypoint_x;
					y = waypoint_y;
					moving = false;
				}
			}
			
		}
       
}