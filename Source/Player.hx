import com.haxepunk.Entity;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Image;

class Player extends Entity {
  
  private var veloc:Vector;
  private var acceleration:Float = 10.0;
  private var friction:Float = 0.9;
  private var timestep:Float = 1e-1;

  public function new (x:Float=320, y:Float=240) {
    super(x,y);

    veloc = new Vector(0,0);

    graphic = Image.createCircle(10, 0xff0000);

    Input.define("left",  [Key.LEFT,  Key.A]);
    Input.define("right", [Key.RIGHT, Key.D]);
    Input.define("up",    [Key.UP,    Key.W]);
    Input.define("down",  [Key.DOWN,  Key.S]);
  }

  override public function update () {
    keyboardMovement();
  }

  private function keyboardMovement() {
    var d:Vector = new Vector(0,0);
    if (Input.check("left"))
      d.x -= 1;
    if (Input.check("right"))
      d.x += 1;
    if (Input.check("up"))
      d.y -= 1;
    if (Input.check("down"))
      d.y += 1;

    if (d.x*d.y != 0) {
      d.x *= 0.707;
      d.y *= 0.707;
    }

    veloc.x += d.x * timestep * acceleration/2;
    veloc.y += d.y * timestep * acceleration/2;

    moveBy(veloc.x, veloc.y);

    veloc.x += d.x * timestep * acceleration/2;
    veloc.y += d.y * timestep * acceleration/2;

    veloc.x *= friction;
    veloc.y *= friction;
    
  }

}
