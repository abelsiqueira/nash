import com.haxepunk.Entity;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Image;

typedef Target = {
  var player:Player;
  var dist:Float;
}

class Player extends Entity {
  
  private var veloc:Vector;
  private var acceleration:Float = 3.0;
  private var friction:Float = 0.9;
  private var timestep:Float = 1e-1;

  private var targets:Array<Target>;

  public function new (x:Float=320, y:Float=240) {
    super(x,y);

    targets = new Array();

    veloc = new Vector(0,0);
  }

  public function addTarget (p:Player, d:Float) {
    var t:Target = {player:p, dist:d};
    targets.push(t);
  }

  override public function update () {
    super.update();
  }

  private function keyboardMovement(d:Vector) {
    d.normalize(timestep);

    veloc.x += d.x * acceleration/2;
    veloc.y += d.y * acceleration/2;

    moveBy(veloc.x, veloc.y);

    veloc.x += d.x * acceleration/2;
    veloc.y += d.y * acceleration/2;

    veloc.x *= friction;
    veloc.y *= friction;
  }

}
