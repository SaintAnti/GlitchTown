package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.util.FlxPath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var grid:FlxTilemap;
	public var face:MemeEmoji;
	//private var movePath = new FlxPath();
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x00000000;
		createGrid();
		face = new MemeEmoji(0, 0);
		add(face);
		super.create();
		
	}
	
	function createGrid():Void
	{
		grid = new FlxTilemap();
		grid.loadMap(Assets.getText("assets/data/grid2.csv"), "assets/images/gridtest4.png", 64, 64);
		grid.setTileProperties(1, FlxObject.NONE);
		add(grid);

	}
	
	function mousemove():Void
	{
		if (FlxG.mouse.justPressed)
		{
			face.x = FlxG.mouse.x;
			face.y = FlxG.mouse.y;
		}
	}
	
	
	/* old movement
	function movement():Void
	{
		if (FlxG.keys.anyPressed(["D, RIGHT"]))
		{
			var coords:Array<FlxPoint> = grid.findPath(FlxPoint.get(face.x, face.y), FlxPoint.get(200, 200));
			if (coords != null)
			{
				movePath.start(face, coords);
			}
		}
	}*/
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		mousemove();
		super.update();
	}	
}