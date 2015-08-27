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
		//basic speed <- this is important
        public var speed:Float = 4;
		
		
		//...these are not important
		public var moving:Bool = false;
		
		var timer: Float = 0;
		var x_speed:Float = 0;
		var y_speed:Float = 0;
		var waypoint_x:Float = FlxG.mouse.x - 16;
		var waypoint_y:Float = FlxG.mouse.y - 16;
		
		var dist_x:Float = 0;
		var dist_y:Float = 0;
		var dist_total:Float = 0;
		//...important stuff starts below
       
        public function new(X:Float=0, Y:Float=0)
        {
                super(X * 64 + 16, Y * 64 + 16);
                loadGraphic("assets/images/memeface2.png", true, 32, 32);
                animation.add("idle1", [1, 2, 3], 1, true);
                animation.play("idle1");
                drag.x = drag.y = 1600;
        }
       
        override public function update():Void
        {
                movement();
                super.update();
        }
		public function movement():Void
        {	
            if (FlxG.mouse.justPressed && FlxG.mouse.x <= (64*7)-16+50 && FlxG.mouse.y <= (64*7)+50) // checks if the mouse is clicked within grid before doign movement.
			{
				x += 1;
				y += 1;
				//sets current mouse co-ordinates as waypoint
				waypoint_x = FlxG.mouse.x - 16;
				waypoint_y = FlxG.mouse.y - 30;
				
				//calculates the x and y distances between player and mouse
				dist_x = waypoint_x - x;
				dist_y = waypoint_y - y;
				dist_total = Math.sqrt((dist_x * dist_x) + (dist_y * dist_y));
				
				//Pythagoras' theorem, bitch
				x_speed = speed * dist_x / dist_total;
				y_speed = speed * dist_y / dist_total;
				
				//changes facing direction according to x_speed (left and right)
				if (x_speed <= 0) {
					this.scale.set(-1.0, 1.0);
				} else {
					this.scale.set(1.0, 1.0);
				}
				
				
				//set moving to true, so that face starts moving
				moving = true;
			}
			
			//when moving is set to, this thing goes in motion..
			if (moving == true) 
			{
				
				//sprite moves in the speed calculated from above
				x += x_speed;
				y += y_speed;
				
				if (Math.abs(x - waypoint_x) <= Math.abs(x_speed) || Math.abs(y - waypoint_y) <= Math.abs(y_speed)) 
				{
					x = waypoint_x;
					y = waypoint_y;
					moving = false;
					this.scale.set(1.0, 1.0);
				}
				
				
				//this section is purely cosmetic;
				//face's size shifts up and down as it moves
				timer++;
				if (timer % 3 == 0) 
				{
					if (x_speed <= 0) {
						this.scale.set(-1.15, 1.0);
					} else {
						this.scale.set(1.15, 1.0);
					}
				} 
				else
				{
					if (x_speed <= 0) {
						this.scale.set(-0.95, 0.95);
					} else {
						this.scale.set(0.95, 0.95);
					}
				}
				
				
			}
			
		}
       
}