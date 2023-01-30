package;

import PlayState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MonkaState extends FlxState
{
	var moni = FlxSprite;
	var love = FlxText;

	override public function create()
	{
		super.create();

		var moni = new FlxSprite();
		moni.loadGraphic(AssetPaths.hot__png);
		add(moni);

		var love = new FlxText(0, 50, 0, "Monka my beloved", 30);
		love.screenCenter(X);
		add(love);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new PlayState());
		}
	}
}
