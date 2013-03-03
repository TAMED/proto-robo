package states
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"proto-robo");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-30,100,"press enter to play");
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			super.update();
			
			if(FlxG.keys.justPressed("ENTER"))
			{
				FlxG.switchState(new PlayState());
			}
		}
	}
}