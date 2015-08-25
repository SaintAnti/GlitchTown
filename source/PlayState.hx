package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var grid:FlxTilemap;
	public var grid2:FlxTilemap;
	private var face:FlxSprite;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x00000000;
		createGrid();
		face = new FlxSprite(16, 16);
		face.loadGraphic("assets/images/memefacetest.png", true, 32, 32);
		face.animation.add("down", [0, 1, 2], 1, true);
	
		add(face);
		face.animation.play("down");
		super.create();
		
	}
	
	function createGrid():Void
	{
		
		grid2 = new FlxTilemap();
		grid2.loadMap(Assets.getText("assets/data/grid2.csv"), "assets/images/gridtest3.png", 64, 64);
		add(grid2);
	}


	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}