package states
{
	import controls.Control;
	import controls.FirstControl;
	
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
	
	import controls.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		public var enemies:FlxGroup;
		public var grapple:FlxSprite;
		public var goal:FlxSprite;
		public var level:FlxTilemap;
		public var curAngle:Number;
		public var controlScheme:Control;
		[Embed(source = '../../maps/demo4.txt', mimeType = 'application/octet-stream')]
		private var map_bg:Class;
		private var aimCanvas:FlxSprite;
		
		public function PlayState(c:Control)
		{
			controlScheme = c;
		}
		
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
			player.makeGraphic(10, 12, 0xffffffff);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x * 4;
			add(player);
			
			// aiming line
			aimCanvas = new FlxSprite(0, 0);
			aimCanvas.makeGraphic(FlxG.width, FlxG.height, 0x00000000);
			add(aimCanvas);
			
			// enemies
			enemies = new FlxGroup();
			var slime1:Slime = new Slime(400, 40);
			slime1.makeGraphic(8, 8, 0xff00ff00);
			enemies.add(slime1);
			var slime2:Slime = new Slime(500, 40);
			slime2.makeGraphic(8, 8, 0xff00ff00);
			enemies.add(slime2);
			add(enemies);
			
			// graphic for grappling hook
			grapple = new FlxSprite(-FlxG.width*2);
			grapple.maxVelocity.x = 500;
			grapple.maxVelocity.y = 500;
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
			curAngle = controlScheme.angleCheck(player);

			// draw aiming line
			aimCanvas.fill(0x00000000);
			// todo: actually implement
			aimCanvas.drawLine(player.x, player.y, 1000, player.y, 0xffffffff);
			
			Grapple.grappleCheck(player, grapple, level, curAngle);
			
			if(player.grappling == 0){
				Walljump.walljumpCheck(player, level);
			}
			

			if(player.grappling == 0 && player.wallJumping == 0){
				controlScheme.movePlayer(player);
			}
			if (FlxG.overlap(player,goal)){
				FlxG.switchState(new WinState());
			}
			
			super.update();
			
			FlxG.collide(player, enemies, enemyContact);			
			FlxG.collide(level, player);
			FlxG.collide(level, enemies);
			FlxG.collide(grapple, level);
		}
		
		private function enemyContact(player:FlxSprite, enemy:Slime):void {
			if (!player.grappling && !player.wallJumping) {
				// player takes damage
				FlxG.switchState(new LoseState());
			} else {
				//enemy dies
				enemy.flicker();
				enemy.kill();
			}
		}
	}
}