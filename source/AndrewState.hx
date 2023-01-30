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

class AndrewState extends FlxState
{
	var doggo = FlxSprite;
	var concy = FlxSprite;
	var love = FlxText;

	override public function create()
	{
		super.create();

		var doggo = new FlxSprite();
		doggo.loadGraphic(AssetPaths.dgo__png);
		add(doggo);

		var concy = new FlxSprite();
		concy.loadGraphic(AssetPaths.conc__png);
		add(concy);

		var love = new FlxText(0, 50, 0, "Dgo and Concow my beloved", 30);
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

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.openURL('https://www.youtube.com/watch?v=hdV8u4ucTKQ&ab_channel=TheConcealedCow');
		}
		if (FlxG.keys.justPressed.A)
		{
			FlxG.openURL('https://tenor.com/view/andrew-tate-top-g-andrew-tate-ass-andrew-tate-discord-tate-gif-26470451');
		}
	}
}
