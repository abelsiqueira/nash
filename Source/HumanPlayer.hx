import com.haxepunk.Entity;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Draw;
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

  override public function render () {
    super.render();
    for (target in targets) {
      var color:Int = target.player.getColor();
      var r:Int = Std.int(color/0x10000);
      var g:Int = Std.int(color%0x10000/0x100);
      var b:Int = color%0x100;
      if (r > 0) r = 1;
      if (g > 0) g = 1;
      if (b > 0) b = 1;
      color = 0xff0000*r + 0x00ff00*g + 0x0000ff*b;
      var d:Vector = new Vector(target.player.x - x, target.player.y - y);
      d.normalize(target.dist);
      Draw.linePlus(Std.int(x), Std.int(y), 
          Std.int(x + d.x), Std.int(y + d.y),
          color, 0.5, 5.0);
    }
  }

}
