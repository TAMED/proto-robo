package entities 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Adrian Mullings
	 */
	public class Slime extends FlxSprite 
	{
		private var dir:int;
		
		public function Slime(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			acceleration.y = 200;
			dir = -1;
		}
		
		override public function update():void
		{
			// if we bump into a wall
			if ((dir == -1 && isTouching(LEFT)) ||
			    (dir ==  1 && isTouching(RIGHT))) {
				// turn around
				dir *= -1;
			}
			
			velocity.x = 30 * dir;
		}
	}

}