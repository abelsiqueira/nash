import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Canvas;
import flash.geom.Rectangle;

class Score extends Entity {

  private var player:Player;
  private var score:Text;

  public function new (x:Float, y:Float, p:Player) {
    super(x, y);

    player = p;

    score = new Text("0");
    var canvas:Canvas = new Canvas(50, 20);
    canvas.fill(new Rectangle(0, 0, 50, 20), 0);
    canvas.fill(new Rectangle(2, 2, 46, 16), p.getColor());

    addGraphic(canvas);
    addGraphic(score);
  }

  override public function update () {
    super.update();

    score.text = Std.string(Std.int(Math.sqrt(Math.sqrt(
        player.objectiveValue()/50000000))));
  }

}
