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
	public var gurkCount:Int = 0;
	public  var numOne:FlxSprite;
	public var numTwo:FlxSprite;
	public  var numThree:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		nums = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7, i:8, j: 9};

		gurk = new FlxSprite().loadGraphic('assets/images/gurk.png');
		gurk.screenCenter();
		gurk.alpha = 0;
		add(gurk);

		counter = new FlxText(0, 50, 0, "Gurks:", 25);
		counter.color = 0xFFFF0000;
		counter.screenCenter(X);
		add(counter);

		numOne = new FlxSprite(0, 50).loadGraphic('assets/images/0.png');
		numOne.screenCenter(X);
		numOne.y = counter.y + 150;
		add(numOne);

		numTwo = new FlxSprite(0, 50).loadGraphic('assets/images/0.png');
		numTwo.screenCenter(X);
		numTwo.x = numOne.x - 50;
		numTwo.y = numOne.y;
		add(numTwo);

		numThree = new FlxSprite(0, 50).loadGraphic('assets/images/0.png');
		numThree.screenCenter(X);
		numThree.x = numTwo.x - 50;
		numThree.y = numOne.y;
		add(numThree);
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
			counter = new FlxText(0, 50, 0, "Gurks: " + gurkCount, 25);
			FlxTween.tween(gurk, {alpha: 0}, 0.5);

			numOne.loadGraphic('assets/images/1.png');
		}
	}
}
