package controls 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	
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
			var angle:Number = (Math.PI * FlxG.mouse.y / FlxG.height) - Math.PI / 2;
			if (player.isLeft) {
				if (angle >= 0) {
					angle = Math.PI - angle;
				} else {
					angle = -Math.PI - angle;
				}
			}
			return angle;
		}
		
		public function movePlayer(player:FlxSprite):void{
			player.acceleration.x = 0;
			if (FlxG.keys.A) {
				player.acceleration.x = -player.maxVelocity.x * 4;
				player.isLeft = true;
			}
			if (FlxG.keys.D) {
				player.acceleration.x = player.maxVelocity.x * 4;
				player.isLeft = false;
			}
			if (FlxG.keys.W && player.isTouching(FlxObject.FLOOR)) {
				player.velocity.y = -player.maxVelocity.y / 2;
			}
		}
		public function grappleButton():Boolean{
			return FlxG.mouse.justPressed();
		}
		public function walljumpButton():Boolean{
			return FlxG.keys.SPACE;
		}
	}

}