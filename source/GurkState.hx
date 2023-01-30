package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class GurkState extends FlxState
{
	public var gurk:FlxSprite;
	public var counter:FlxText;

	override public function create():Void
	{
		super.create();

		gurk = new FlxSprite().loadGraphic('assets/images/gurk.png');
		gurk.screenCenter();
		gurk.alpha = 0;
		add(gurk);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.justPressed.SPACE)
		{
			// com
			FlxG.sound.play(AssetPaths.vine__ogg);
			gurk.alpha = 1;
			FlxTween.tween(gurk, {alpha: 0}, 0.5);
		}
	}
}
