package states
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class LoseState extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			FlxG.bgColor = 0xff000000;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"Game Over...\nTry to die less next time.");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-70,FlxG.height-30,140,"press enter to play again");
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

