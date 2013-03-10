package controls 
{
	import org.flixel.FlxPoint;
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
			var playerPos:FlxPoint = player.getScreenXY();
			var mousePos:FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			return Math.atan2((mousePos.y - playerPos.y),(mousePos.x - playerPos.x));
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