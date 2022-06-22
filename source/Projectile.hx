package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Projectile extends FlxSprite
{
	private var texturePackerData:FlxAtlasFrames;
	private var speed:Float = 2000;

	public function new()
	{
		super();

		texturePackerData = FlxAtlasFrames.fromTexturePackerJson("assets/images/ingameSprites.png", "assets/data/ingameSprites.json");
		this.frames = texturePackerData;
		this.animation.frameName = "projectile.png";
		this.velocity.x = speed;
	}
}
