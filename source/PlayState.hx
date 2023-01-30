package;

import AndrewState;
import AwkayState;
import FunnyState;
import GurkState;
import MonkaState;
import RailState;
import SkryState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var bg:FlxSprite;
	var text:FlxText;
	var text2:FlxText;
	var miniLoaf:FlxSound;
	var nextState:FlxState;
	var FunnyState:FlxState;

	override public function create()
	{
		super.create();

		var bg = new FlxSprite();
		bg.loadGraphic(AssetPaths.deez__png);
		add(bg);

		var sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.epic__png);
		add(sprite);

		var text = new flixel.text.FlxText(0, 0, 0, "I must have dementia because I don't remember asking", 10);
		text.screenCenter();
		add(text);

		var text2 = new flixel.text.FlxText(0, 0, 0, "Press space for bong", 20);
		text2.setFormat(null, 40, FlxColor.BLUE);
		add(text2);

		var nextState = new FlxState(1);

		var FunnyState = new FlxState(1);

		FlxTween.tween(sprite, {
			x: FlxG.width - sprite.width,
			y: FlxG.height - sprite.height,
			angle: 360.0
		}, 0.1, {type: FlxTweenType.PINGPONG});

		//	FlxTween.color(sprite, 0.5, 0xffffff, 0x000000, {});
		//	FlxTween.color(sprite, 2.0, 0x000000, 0xffffff, 0.0, 1.0, {});

		// fix thingy later lol	FlxG.sound.playMusic(AssetPaths.miniLoaf__ogg, 0);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE)
		{
			// trace("Deez");
			FlxG.sound.play(AssetPaths.bong__ogg);
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			FlxG.sound.play(AssetPaths.bb1__ogg);
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new FunnyState());
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new SkryState());
		}

		if (FlxG.keys.justPressed.M)
		{
			FlxG.switchState(new MonkaState());
		}

		if (FlxG.keys.justPressed.BACKSPACE)
		{
			FlxG.switchState(new AndrewState());
		}

		if (FlxG.keys.justPressed.ONE)
		{
			FlxG.switchState(new AwkayState());
		}

		if (FlxG.keys.justPressed.GRAVEACCENT)
		{
			FlxG.switchState(new RailState());
		}

		if (FlxG.keys.justPressed.G)
		{
			FlxG.switchState(new GurkState());
		}
	}
}
