package weapons
{
	import org.flixel.*;
	
	public class Grapple
	{	
		/**
		 * Checks if we're grappling. Uses player.touching which gives a uint with one bit
		 * For each surface of the object to check if they're touching. Moves until it hits
		 * a surface that was in the direction we grappled.
		 */
		public static function grappleCheck(player:FlxSprite, level:FlxTilemap):void {
			// check if grappling is over
			if((player.touching & player.grappling) != 0){
				player.acceleration.y = 200;
				player.grappling = 0;
				return;
			}
			if(FlxG.keys.PERIOD && player.grappling == false){
				// only actually grapple if we're pressing a directional key
				if(FlxG.keys.A || FlxG.keys.D || FlxG.keys.S || FlxG.keys.W){
					player.velocity.x = 0;
					player.velocity.y = 0;
					// hack to remove drag. Delete when grappling hook improved.
					player.acceleration.x = .001;
					player.acceleration.y = .001;
				}
				// add the velocity for a direction, and add that to grappling
				if(FlxG.keys.A){
					player.velocity.x -= player.maxVelocity.x;
					player.grappling += FlxObject.LEFT;
				}
				if(FlxG.keys.W){
					player.velocity.y -= player.maxVelocity.y;
					player.grappling += FlxObject.UP;
				}
				if(FlxG.keys.D){
					player.velocity.x += player.maxVelocity.x;
					player.grappling += FlxObject.RIGHT;
				}
				if(FlxG.keys.S){
					player.velocity.y += player.maxVelocity.y;
					player.grappling += FlxObject.DOWN;
				}
			}
			return;
		}
	}
}
	