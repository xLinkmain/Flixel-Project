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
	public var gurkCount = 0;

	override public function create():Void
	{
		super.create();

		gurk = new FlxSprite().loadGraphic('assets/images/gurk.png');
		gurk.screenCenter();
		gurk.alpha = 0;
		add(gurk);

		counter = new FlxText(0, 50, 0, "Gurks: " + gurkCount, 25);
		counter.color = 0xFFFF0000;
		counter.screenCenter(X);
		add(counter);
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
			gurkCount = gurkCount + 1;
			FlxTween.tween(gurk, {alpha: 0}, 0.5);
		}
	}
}
