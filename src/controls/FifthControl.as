package controls 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author Adrian Mullings
	 */
	public class FifthControl implements Control 
	{
		
		public function FifthControl() 
		{
			FlxG.mouse.show();
		}
		
		/* INTERFACE controls.Control */
		
		public function angleCheck(player:FlxSprite):Number 
		{
			return FlxU.getAngle(player.origin, FlxG.mouse) / 180 * Math.PI;
		}
		
	}

}