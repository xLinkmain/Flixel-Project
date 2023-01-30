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

class AwkayState extends FlxState
{
	var awk = FlxSprite;
	var leek = FlxText;
	var butt_on = FlxButton;

	override public function create()
	{
		super.create();

		var awk = new FlxSprite();
		awk.loadGraphic(AssetPaths.satan_thouself__png);
		awk.screenCenter();
		awk.scale.set(0.5, 0.5);
		add(awk);

		var leek = new flixel.text.FlxText(0, 0, 0, "I love balls in my mouth", 20);
		leek.setFormat(null, 20, FlxColor.RED);
		leek.screenCenter();
		add(leek);

		FlxG.sound.playMusic(AssetPaths.radical__mp3);

		var butt_on = new FlxButton(0, 0, "DEEZ", cake);
		butt_on.screenCenter();
		add(butt_on);

		/*FlxTween.tween(awk, {
				x: FlxG.width - awk.width,
				y: FlxG.height - awk.height,
				angle: 360.0
			}, 0.1, {type: FlxTweenType.PINGPONG});
		 */
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new PlayState());
		}
	}

	public function cake():Void
	{
		FlxG.openURL('https://cdn.discordapp.com/attachments/1066550428088676402/1066555416634478602/E7vrOpsWQAQtJna.jpg');
	}
}
