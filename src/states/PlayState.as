package states
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff5d16ad;
			FlxG.framerate = 60;
						
			player = new FlxSprite(FlxG.width / 2 - 5);
			player.makeGraphic(10, 12, 0xffffffff);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x * 4;
			add(player);
		}
		
		override public function update():void
		{
			player.acceleration.x = 0;
			if (FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x * 4;
			if (FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x * 4;
			if (FlxG.keys.SPACE)// && player.isTouching(FlxObject.FLOOR))
				player.velocity.y = -player.maxVelocity.y / 2;
			
			// hack: please remove once level is imported
			if (player.y > FlxG.height - player.height) {
				if (player.velocity.y >= 0) {
					player.velocity.y = 0;
				}
			}
			
			super.update();
			
			//FlxG.collide(level, player);
		}
	}
}