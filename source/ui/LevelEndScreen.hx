package source.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class LevelEndScreen extends FlxState
{
	private var background:FlxSprite;
	private var txtGameScore:FlxText;

	public function new(score:Int)
	{
		super();

		background = new FlxSprite();
		background.makeGraphic(FlxG.stage.stageWidth, FlxG.stage.stageHeight, FlxColor.BLACK);
		background.alpha = 0.2;
		add(background);

		txtGameScore = new FlxText(0, 0, 500, "Final score: " + score + "\nClick to play again", 40);
		txtGameScore.setPosition(FlxG.stage.stageWidth / 2 - txtGameScore.width / 2, FlxG.stage.stageHeight / 2 - txtGameScore.height / 2);
		add(txtGameScore);
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.mouse.justReleased)
		{
			onPlayAgain();
		}

		super.update(elapsed);
	}

	private function onPlayAgain():Void
	{
		FlxG.resetState();
	}
}
