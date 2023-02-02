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
	public var gurkCount2:Int = 0;
	public var gurkCount3:Int = 0;
	public  var numOne:FlxSprite;
	public var numTwo:FlxSprite;
	public  var numThree:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		nums = {a: assets/images/0.png, b: assets/images/1.png, c: assets/images/2.png, d: assets/images/3.png, e: assets/images/4.png, f: assets/images/6.png, g: assets/images/6.png, h: assets/images/7.png, i: assets/images/8.png, j: assets/images/9.png};

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
			FlxTween.tween(gurk, {alpha: 0}, 0.5);

			numOne.loadGraphic('assets/images/1.png');
		}
		
		if gurkCount == 10
		{
			gurkCount = 0;
			gurkCount2 = gurkCount2 + 1;
		}
		
		if gurkCount2 == 10
		{
			gurkCount2 = 0;
			gurkCount3 = gurkCount3 + 1;
		}
	}
}
