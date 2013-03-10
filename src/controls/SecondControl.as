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
	
	public class SecondControl implements Control
	{
		public function angleCheck(player:FlxSprite):Number{
			var angle:Number = 0;
			if(FlxG.keys.justPressed("W") && player.aimAngle > -Math.PI/2 + .01){
				player.aimAngle -= Math.PI/4;
			}
			if(FlxG.keys.justPressed("S") && player.aimAngle < Math.PI/2 - .01){
				player.aimAngle += Math.PI/4;
			}
			if(player.isLeft){
				angle = Math.PI - player.aimAngle;
			}
			else {
				angle = player.aimAngle;
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
			if (FlxG.keys.SPACE && player.isTouching(FlxObject.FLOOR)) {
				player.velocity.y = -player.maxVelocity.y / 2;
			}
		}
		public function grappleButton():Boolean{
			return FlxG.keys.justPressed("J");
		}
		public function walljumpButton():Boolean{
			return FlxG.keys.K;
		}
	}
}