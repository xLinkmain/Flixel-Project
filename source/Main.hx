package;

import FunnyState;
import PlayState;
import SkryState;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, SkryState));
		// CHILDREN
	}
	// public function update(elapsed)
}
