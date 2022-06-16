package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import ui.GameHUD;
import ui.LevelEndScreen;

class PlayState extends FlxState
{
	private var background:FlxSprite;

	private var numEnemies:Int = 20;
	private var score:Int = 0;
	private var enemyPointValue:Int = 155;
	private var enemies:Array<Enemy>;

	// timer of whole game
	private var levelTimer:FlxTimer;
	private var levelTime:Int = 15;
	private var ticks:Int = 0;

	// Game HUD
	private var gameHud:GameHUD;
	private var enemyLayer:FlxGroup;

	override public function create()
	{
		super.create();
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.gameBackground__png);
		add(background);

		enemyLayer = new FlxGroup();
		add(enemyLayer);

		gameHud = new GameHUD();
		add(gameHud);

		enemies = new Array<Enemy>();
		var enemy:Enemy;
		for (i in 0...numEnemies)
		{
			enemy = new Enemy();
			enemyLayer.add(enemy);
			enemies.push(enemy);
			FlxMouseEventManager.add(enemy, onEnemyMouseDown);
		}

		levelTimer = new FlxTimer();
		levelTimer.start(1, onTimeComplete, levelTime);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function onEnemyMouseDown(object:FlxObject):Void
	{
		object.visible = false;
		score += enemyPointValue;
		gameHud.setScore(score);
	}

	private function onTimeComplete(timer:FlxTimer):Void
	{
		ticks++;

		if (ticks >= levelTime)
		{
			var levelEndScreen:LevelEndScreen = new LevelEndScreen(score);
			add(levelEndScreen);
		}
	}

	override function destroy()
	{
		for (i in 0...enemies.length)
		{
			FlxMouseEventManager.remove(enemies[i]);
		}
		super.destroy();
	}
}
