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
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x00000000;
		createGrid();
		super.create();
		
	}
	
	function createGrid():Void
	{
		grid = new FlxTilemap();
		grid.loadMap(Assets.getText("assets/data/grid.csv"), "assets/images/grid.png", 64, 64);
		add(grid);
		grid2 = new FlxTilemap();
		grid2.loadMap(Assets.getText("assets/data/grid2.csv"), "assets/images/grid.png", 64, 64);
		add(grid2);
		
	}
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
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