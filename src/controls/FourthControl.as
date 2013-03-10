package controls 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Adrian Mullings
	 */
	public class FourthControl implements Control 
	{
		
		public function FourthControl() 
		{
			FlxG.mouse.show();
		}
		
		/* INTERFACE controls.Control */
		
		public function angleCheck(player:FlxSprite):Number 
		{
			return Math.PI/2 - (Math.PI * FlxG.mouse.y / FlxG.height);
		}
		
	}

}