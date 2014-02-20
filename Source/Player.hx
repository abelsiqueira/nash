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

  static private var color_count:Int = 0;
  private var color:Int;

  private var targets:Array<Target>;

  public function new (x:Float=320, y:Float=240) {
    super(x,y);

    targets = new Array();
    var r:Int = color_count%2;
    var g:Int = Std.int(color_count/2)%2;
    var b:Int = Std.int(color_count/4)%2;

    color = 0xaf0000*r + 0x00af00*g + 0x0000af*b;

    graphic = Image.createCircle(10, color);
    color_count++;

    veloc = new Vector(0,0);
  }

  public function getColor () : Int {
    return color;
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

  public function objectiveValue () : Float {
    var f:Float = 0.0;
    for (target in targets) {
      var dist:Float = Math.pow(target.player.x - x, 2) +
          Math.pow(target.player.y - y, 2) -
          Math.pow(target.dist, 2);
      f += dist*dist;
    }

    return f;
  }

}
