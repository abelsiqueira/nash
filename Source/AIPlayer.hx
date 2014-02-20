import com.haxepunk.Entity;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Image;

class AIPlayer extends Player {
  
  private var counter:Int = 301;
  private var counts_dir_change:Int = 300;
  private var d:Vector;
  private var ai:Int;

  public function new (x:Float=320, y:Float=240, ai:Int=0) {
    super(x,y);

    acceleration *= 0.5;
    d = new Vector(0,0);
    this.ai = ai;
  }

  public function setAI (ai:Int) {
    this.ai = ai;
  }

  override public function update () {
    super.update();

    getNewDirection(d);

    keyboardMovement(d);
  }

  private function getNewDirection (d:Vector) {
    if (ai == 0) {}
    else if (ai == 1)
      localMinimizerDirection(d);
    else if (ai == 2)
      randomDirection(d);
  }

  private function localMinimizerDirection (d:Vector) {
    d.x = 0;
    d.y = 0;
    for (target in targets) {
      var dist:Float = Math.pow(target.player.x - x, 2) +
          Math.pow(target.player.y - y, 2) - 
          Math.pow(target.dist, 2);
      d.x -= (x - target.player.x)*dist;
      d.y -= (y - target.player.y)*dist;
    }
  }

  private function randomDirection (d:Vector) {
    counter++;
    if (counter > counts_dir_change) {
      d.x = Std.random(3) - 1;
      d.y = Std.random(3) - 1;
      counter = 0;
    }
  }
}
