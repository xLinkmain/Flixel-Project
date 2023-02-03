package;

import PlayState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import haxe.Timer;

class FunnyState extends FlxState
{
	public var box:FlxSprite;
	public var skry:FlxSprite;
	public var boy:FlxSprite;
	public var splash:FlxSprite;
	public var hitTimer:FlxTimer;
	public var hear:FlxSprite;
	public var frames:FlxAtlasFrames;

	override public function create()
	{
		super.create();

		var deezNuts = 5;

		var skryHealth = 3;

		hitTimer = new FlxTimer();

		box = new FlxSprite();
		box.loadGraphic(AssetPaths.nuts__png);
		add(box);

		skry = new FlxSprite();
		skry.loadGraphic(AssetPaths.dan__png);
		skry.screenCenter();
		add(skry);

		boy = new FlxSprite();
		boy.loadGraphic(AssetPaths.boyf__png);
		boy.scale.set(0.7, 0.7);
		add(boy);

		splash = new FlxSprite();
		splash.loadGraphic(AssetPaths.cumSplash__png, true, 220, 196);
		splash.animation.add('spurt', [0, 1, 2, 3, 4, 5, 6, 7], 24, false);
		splash.animation.play('spurt', true, false, 7);
		add(splash);

		hear = new FlxSprite();
		hear.loadGraphic('assets/images/heart.png', true, 100, 100);
		var hearTex = FlxAtlasFrames.fromSparrow('assets/images/heart.png', 'assets/images/heart.xml');
		frames = hearTex;

		hear.animation.addByPrefix('idle', 'idle', 24, false);
		hear.animation.addByPrefix('hurt', 'so sad i cried', 24, false);
		hear.animation.addByPrefix('good', 'so good i chuckled!', 24, false);

		add(hear);

		FlxTween.tween(boy, {
			x: skry.x,
			y: skry.y
		}, 1, {onComplete: deitz});
	}

	public function deitz(tween:FlxTween)
	{
		FlxTween.tween(boy, {
			x: skry.x,
			y: skry.y
		}, 0.69420, {onComplete: deitz});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ONE)
		{
			hear.animation.play('idle', true, false, 0);
		}

		if (FlxG.keys.justPressed.TWO)
		{
			hear.animation.play('hurt', true, false, 0);
		}

		if (FlxG.keys.justPressed.THREE)
		{
			hear.animation.play('good', true, false, 0);
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.pressed.LEFT)
		{
			skry.x = skry.x - 10;
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			skry.x = skry.x + 10;
		}

		if (FlxG.keys.pressed.UP) // uppy refrence
		{
			skry.y = skry.y - 10;
		}

		if (FlxG.keys.pressed.DOWN)
		{
			skry.y = skry.y + 10;
		}

		if (FlxG.keys.justPressed.SPACE)
		{
			attack();
			// splash.animation.play('spurt', true, false, 0);
		}

		FlxG.overlap(skry, boy, hurt);

		splash.x = skry.x - 10;

		splash.y = skry.y;
	}

	public function hurt(skry:flixel.FlxObject, boy:flixel.FlxObject):Void
	{
		// commet

		// dan.visible = false;
	}

	public function attack():Void
	{
		splash.animation.play('spurt', true, false, 0);

		FlxG.overlap(splash, boy, hit);
	}

	public function hit(splash:flixel.FlxObject, boy:flixel.FlxObject):Void
	{
		// coo

		// boy.color = 0xFFFF0000;

		hitTimer.start(0.5, unRed, 1);
	}

	public function unRed(timer:FlxTimer):Void
	{
		// boy.color = 0xFFFFFFFF;

		// FlxG.switchState(new PlayState());
	}
}
