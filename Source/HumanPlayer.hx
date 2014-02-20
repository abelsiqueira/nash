import com.haxepunk.Entity;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Image;

class HumanPlayer extends Player {
  
  public function new (x:Float=320, y:Float=240) {
    super(x,y);

    Input.define("left",  [Key.LEFT,  Key.A]);
    Input.define("right", [Key.RIGHT, Key.D]);
    Input.define("up",    [Key.UP,    Key.W]);
    Input.define("down",  [Key.DOWN,  Key.S]);
  }

  override public function update () {
    super.update();

    var d:Vector = new Vector(0,0);
    if (Input.check("left"))
      d.x -= 1;
    if (Input.check("right"))
      d.x += 1;
    if (Input.check("up"))
      d.y -= 1;
    if (Input.check("down"))
      d.y += 1;

    keyboardMovement(d);
  }

}
