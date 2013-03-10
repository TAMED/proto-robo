package controls
{
	import entities.Slime;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	
	import weapons.Grapple;
	import weapons.Walljump;

	public class FirstControl implements Control
	{
		public function angleCheck(player:FlxSprite):Number{
			var angle:Number = 0;
			if (!(FlxG.keys.W || FlxG.keys.S)) {
				if (FlxG.keys.A && !FlxG.keys.D){
					angle = Math.PI;
				}
				if(FlxG.keys.A && FlxG.keys.D && player.facing == FlxObject.LEFT) {
					angle = Math.PI;
				}
			}
			else{
				if (FlxG.keys.W){
					angle -= Math.PI/2
					if (FlxG.keys.A){
						angle -= Math.PI/4;
					}
					if (FlxG.keys.D) {
						angle += Math.PI/4;
					}
				}
				if (FlxG.keys.S){
					angle += Math.PI/2
					if (FlxG.keys.A){
						angle += Math.PI/4;
					}
					if (FlxG.keys.D) {
						angle -= Math.PI/4;
					}
				}
			}
			return angle;
		}
		public function movePlayer(player:FlxSprite):void{
			player.acceleration.x = 0;
			if (FlxG.keys.A)
				player.acceleration.x = -player.maxVelocity.x * 4;
			if (FlxG.keys.D)
				player.acceleration.x = player.maxVelocity.x * 4;
			if (FlxG.keys.SPACE && player.isTouching(FlxObject.FLOOR))
				player.velocity.y = -player.maxVelocity.y / 2;
		}
		public function grappleButton():Boolean{
			return FlxG.keys.J;
		}
		public function walljumpButton():Boolean{
			return FlxG.keys.K;
		}
	}
}