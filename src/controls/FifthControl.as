package controls 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxObject;
	
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
		
		public function movePlayer(player:FlxSprite):void{
			player.acceleration.x = 0;
			if (FlxG.keys.A)
				player.acceleration.x = -player.maxVelocity.x * 4;
			if (FlxG.keys.D)
				player.acceleration.x = player.maxVelocity.x * 4;
			if (FlxG.keys.W && player.isTouching(FlxObject.FLOOR))
				player.velocity.y = -player.maxVelocity.y / 2;
		}
	}

}