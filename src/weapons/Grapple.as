package weapons
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	import controls.Control;
	
	public class Grapple
	{	
		/**
		 * Checks if we're grappling. Uses player.touching which gives a uint with one bit
		 * For each surface of the object to check if they're touching. Moves until it hits
		 * a surface that was in the direction we grappled.
		 */
		public static function grappleCheck(player:FlxSprite, grapple:FlxSprite, level:FlxTilemap, angle:Number, control:Control):void {
			// check if grappling hook hit wall, and move player to it.
			if(grapple.touching != 0){
				grapple.velocity.x = 0;
				grapple.velocity.y = 0;
				player.maxVelocity.x = 300;
				player.maxVelocity.y = 300;
				var xvel:Number = grapple.x - player.x;
				var yvel:Number = grapple.y - player.y;
				var ratio:Number;
				if(Math.abs(yvel/player.maxVelocity.y) > Math.abs(xvel/player.maxVelocity.x)){
					ratio = player.maxVelocity.y/yvel;
				}
				else {
					ratio = player.maxVelocity.x/xvel;
				}
				ratio = Math.abs(ratio);
				player.velocity.x = xvel*ratio;
				player.velocity.y = yvel*ratio;
			}
			// check if player hit a wall to stop grappling
			if((player.touching & player.grappling) != 0){
				player.acceleration.y = 200;
				player.grappling = 0;
				grapple.x = -FlxG.width*2;
				grapple.x = -FlxG.height*2;
				player.maxVelocity.x = 80;
				player.maxVelocity.y = 200;
				player.velocity.x = 0;
				player.velocity.y = 0;
				return;
			}
			if(control.grappleButton() && player.grappling == false){
				// hack to remove drag. Delete when grappling hook improved.
				player.acceleration.x = .001;
				player.acceleration.y = .001;
				grapple.x = player.x;
				grapple.y = player.y;
				grapple.velocity.y = Math.sin(angle)*grapple.maxVelocity.y;
				grapple.velocity.x = Math.cos(angle)*grapple.maxVelocity.x;
				trace(angle);
				if (Math.sin(angle) < 0) {
					player.grappling += FlxObject.UP;
				}
				if (Math.cos(angle) > 0) {
					player.grappling += FlxObject.RIGHT;
				}
				if (Math.sin(angle) > 0) {
					player.grappling += FlxObject.DOWN;
				}
				if (Math.cos(angle) < 0) {
					player.grappling += FlxObject.LEFT;
				}
			}
			return;
		}
	}
}
	