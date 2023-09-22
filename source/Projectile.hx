package;

import AssetPaths;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Projectile extends FlxSprite
{
	private var texturePackerData:FlxAtlasFrames;
	private var speed:Float = 2000;

	public function new()
	{
		super();

		texturePackerData = FlxAtlasFrames.fromTexturePackerJson(AssetPaths.ingameSprites__png, AssetPaths.ingameSprites__json);
		this.frames = texturePackerData;
		this.animation.frameName = "projectile.png";
		this.velocity.x = speed;
	}
}
