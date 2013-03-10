package states
{
	import org.flixel.*;
	
	import controls.*

	public class MenuState extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"proto-robo");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-30,100,"Select Controls: 1-5");
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			super.update();
			
			if(FlxG.keys.justPressed("ONE"))
			 	start(new FirstControl());
			
			if(FlxG.keys.justPressed("TWO"))
				start(new SecondControl());
			
			if(FlxG.keys.justPressed("THREE"))
				start(new ThirdControl());
				
			if(FlxG.keys.justPressed("FOUR"))
				start(new FourthControl());
			
			if(FlxG.keys.justPressed("FIVE"))
				start(new FifthControl());
		}
		
		private function start(controls:Control):void
		{
			FlxG.switchState(new PlayState(controls));
		}
	}
}