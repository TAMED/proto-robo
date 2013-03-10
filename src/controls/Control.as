package controls 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Adrian Mullings
	 */
	public interface Control 
	{
		function angleCheck(player:FlxSprite):Number;
		function movePlayer(player:FlxSprite):void;
		function grappleButton():Boolean;
		function walljumpButton():Boolean;
	}
	
}