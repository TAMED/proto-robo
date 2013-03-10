package weapons
{
	import controls.Control;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	
	public class Walljump
	{	
		/**
		 * Checks if we're grappling. Uses player.touching which gives a uint with one bit
		 * For each surface of the object to check if they're touching. Moves until it hits
		 * a surface that was in the direction we grappled.
		 */
		public static function walljumpCheck(player:FlxSprite, level:FlxTilemap, control:Control):void {
			if (player.wallJumping > 0) {
				player.velocity.x = player.wallJumpX;
				player.wallJumping += 1;
				if (player.wallJumping > 30){
					player.wallJumping = 0;
					player.wallJumpX = 0;
				}
			}
			else if (control.walljumpButton()) {
				if (player.isTouching(FlxObject.LEFT)) {
					player.velocity.y = -player.maxVelocity.y / 2;
					player.wallJumpX = player.maxVelocity.x;
					
					player.wallJumping = 1;
				}
				if (player.isTouching(FlxObject.RIGHT)) {
					player.velocity.y = -player.maxVelocity.y / 2;
					player.wallJumpX = -player.maxVelocity.x;
					player.wallJumping = 1;
				}	
			}
		}
	}
}




