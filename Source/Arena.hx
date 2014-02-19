import com.haxepunk.Scene;

class Arena extends Scene {

  public function new () {
    super();

    add(new Player());
  }

}
