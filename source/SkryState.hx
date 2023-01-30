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
import lime.media.vorbis.VorbisComment;

class SkryState extends FlxState
{
	var poggers:FlxSprite;
	var logo:FlxSprite;
	var teggs:FlxText;
	var camPringleButton:FlxButton;
	var daveDeathButton:FlxButton;

	override public function create()
	{
		super.create();

		var poggers = new FlxSprite();
		poggers.loadGraphic(AssetPaths.swaggy__png);
		add(poggers);

		var logo = new FlxSprite();
		logo.loadGraphic(AssetPaths.funk__png, true, 412, 249);
		logo.animation.add('bumpin', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 12, true);
		logo.screenCenter();
		logo.y = 40;
		logo.animation.play('bumpin');
		add(logo);

		var teggs = new FlxText(0, 400, 0, 'PRESS ENTER', 20);
		teggs.x = 240;
		add(teggs);

		var camPringleButton = new FlxButton(0, 0, "NM PRINGLE", pringle);
		add(camPringleButton);

		var daveDeathButton = new FlxButton(0, 50, "Dave Dead", dave);
		add(daveDeathButton);

		FlxG.sound.play(AssetPaths.fnf__ogg);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.justPressed.SPACE)
		{
			// WHY CODE NO WORK!!!!!!!!!!!!!!	FlxTween.tween(logo, {y: logo.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});
		}
	}

	public function pringle():Void
	{
		FlxG.openURL('https://tenor.com/view/ninjamuffin_99-eating-pringles-gif-22535098');
	}

	public function dave():Void
	{
		FlxG.openURL('https://cdn.discordapp.com/attachments/1046992895019843595/1069121291275206656/FkdXyneWIAYjV22.jpg');
	}
}
