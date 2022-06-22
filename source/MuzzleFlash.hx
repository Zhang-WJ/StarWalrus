package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class MuzzleFlash extends FlxGroup
{
	private var texturePackerData:FlxAtlasFrames;
	private var flash:FlxSprite;
	private var flashXOffset:Float = 330;
	private var flashYOffset:Float = 90;

	private var rings:FlxSprite;
	private var ringsXOffset:Float = 340;
	private var ringsYOffset:Float = 80;

	public function new()
	{
		super();
		texturePackerData = FlxAtlasFrames.fromTexturePackerJson("assets/images/ingameSprites.png", "assets/data/ingameSprites.josn");
		flash = new FlxSprite();
		flash.frames = texturePackerData;
		flash.animation.frameName = "muzzlaFlash.png";
		add(flash);
		flash.visible = false;

		rings = new FlxSprite();
		rings.frames = texturePackerData;
		rings.animation.frameName = "muzzlaRings.png";
		add(rings);
		rings.visible = false;
	}

	public function playFlash(x:Float, y:Float):Void
	{
		flash.setPosition(x + flashXOffset, y + flashYOffset);
		rings.setPosition(x + ringsXOffset, y + ringsYOffset);

		flash.scale.y = 0;
		flash.scale.x = 0;

		flash.alpha = 1;
		flash.visible = true;

		FlxTween.tween(flash.scale, {x: 1, y: 1}, 0.1, {ease: FlxEase.quadIn, onComplete: showRings});
	}

	private function showRings(tween:FlxTween):Void
	{
		flash.alpha = 0;
		flash.visible = false;
		rings.scale.y = 0;
		rings.scale.x = 0;

		FlxTween.tween(rings.scale, {x: 1.5, y: 1.5}, 0.15, {ease: FlxEase.quadIn});
	}
}
