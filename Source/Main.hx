import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Key;

class Main extends Engine {
	
	public function new () {
		super (640, 480, 30, false);

#if debug
    HXP.console.enable();
    HXP.console.toggleKey = Key.E;
#end
    HXP.scene = new Arena();
	}
	
  override public function update() {
    super.update();
  }

  public static function main() {
    new Main();
  }
	
}
