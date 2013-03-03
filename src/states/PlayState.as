package states
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	
	import weapons.Grapple;
	import weapons.Walljump;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		public var grapple:FlxSprite;
		public var goal:FlxSprite;
		public var level:FlxTilemap;
		[Embed(source = '../../maps/demo4.txt', mimeType = 'application/octet-stream')]
		private var map_bg:Class;
		
		override public function create():void
		{
			
			FlxG.bgColor = 0xff5d16ad;
			FlxG.framerate = 60;
			
			var dataString:String = new map_bg();
			var data:Array = dataString.split(",");
			level = new FlxTilemap();			
			level.loadMap(FlxTilemap.arrayToCSV(data,154),FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
			add(level);
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			player = new FlxSprite(FlxG.width / 2 - 5, 12);
			player.makeGraphic(10, 12, 0xff00ff00);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x * 4;
			add(player);
			// graphic for grappling hook
			grapple = new FlxSprite(-FlxG.width*2);
			grapple.makeGraphic(5, 5, 0xffffffff);
			add(grapple);
			goal = new FlxSprite(1130,37);
			goal.makeGraphic(10,10,0xffEEDC82);
			add(goal);
			FlxG.camera.follow(player);
			level.follow();
		}
		
		override public function update():void
		{	
			Grapple.grappleCheck(player, grapple, level);
			
			if(player.grappling == 0){
				Walljump.walljumpCheck(player, level);
			}
			

			if(player.grappling == 0 && player.wallJumping == 0){
				player.acceleration.x = 0;
				if (FlxG.keys.A)
					player.acceleration.x = -player.maxVelocity.x * 4;
				if (FlxG.keys.D)
					player.acceleration.x = player.maxVelocity.x * 4;
				if (FlxG.keys.COMMA && player.isTouching(FlxObject.FLOOR))
					player.velocity.y = -player.maxVelocity.y / 2;
			}
			if (FlxG.overlap(player,goal)){
				FlxG.switchState(new WinState());
			}
			
			super.update();
			FlxG.collide(level, player);
			FlxG.collide(grapple, level);
		}
	}
}