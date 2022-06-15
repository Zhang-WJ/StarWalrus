package;

import flixel.FlxGame;
import flixel.FlxState;
import openfl.display.Sprite;

class Main extends Sprite
{
	var initialState:Class<FlxState> = MenuState;

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
