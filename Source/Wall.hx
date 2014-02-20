import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Wall extends Entity {

  public function new (x:Float, y:Float, w:Int, h:Int) {
    super(x,y);

    type = "wall";
    setHitbox(w,h);
    graphic = Image.createRect(w, h, 0x666666);
  }
}
