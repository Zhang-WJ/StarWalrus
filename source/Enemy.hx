package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import js.lib.Math;

class Enemy extends FlxSprite
{
	private var spawnTimer:FlxTimer;
	private var maxSpawnTime:Float = 14;

	private var maxY:Int = 500;
	private var minY:Int = 0;

	private var texturePackerData:FlxAtlasFrames;
	private var movementTween:FlxTween;

	private var minSpeed:Float = 2.0;
	private var maxSpeed:Float = 3.5;

	public function new()
	{
		super();
		texturePackerData = FlxAtlasFrames.fromTexturePackerJson(AssetPaths.ingameSprites__png, AssetPaths.ingameSprites__json);
		this.frames = texturePackerData;
		var names = [];
		for (i in 0...2)
		{
			names.push("RocketKitty0" + i + ".png");
		}
		animation.addByNames("Animation", names, 8);
		animation.play('Animation');

		this.visible = false;
		spawnTimer = new FlxTimer();

		resetSpawn();
	}

	private function onSpawn(timer:FlxTimer):Void
	{
		this.visible = true;
		var randomY:Int = (Math.floor(Math.random() * (maxY - minY + 1)) + minY);
		this.y = randomY;
		var randomSpeed:Float = (Math.random() * (maxSpeed - minSpeed + 1) + minSpeed);
		movementTween = FlxTween.tween(this, {x: -width}, randomSpeed, {
			ease: FlxEase.quadIn,
			onComplete: resetSpawn
		});
	}

	private function resetSpawn(tween:FlxTween = null):Void
	{
		this.visible = false;
		this.alpha = 1;
		setPosition(FlxG.width + width, 0);

		var spawnTime:Float = Math.random() * (maxSpawnTime + 1);
		spawnTimer.start(spawnTime, onSpawn);
		this.solid = true;
	}

	public function killEnemy():Void
	{
		this.solid = false;
		movementTween.cancel();
		FlxTween.tween(this, {alpha: 0}, 0.15, {
			ease: FlxEase.quadIn,
			onComplete: resetSpawn
		});
	}
}
