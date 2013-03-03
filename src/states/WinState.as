package states
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class WinState extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			FlxG.bgColor = 0xff000000;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"You Win!");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-30,100,"press enter to play again");
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
import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

