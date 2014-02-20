import com.haxepunk.Scene;
import com.haxepunk.HXP;

class Arena extends Scene {

  private var players:Array<Player>;

  public function new () {
    super();

    players = [new HumanPlayer()];

    var w:Int = Std.int(0.1*HXP.width);
    var h:Int = Std.int(0.1*HXP.height);
    players.push(new AIPlayer(  w,  h,1));
    players.push(new AIPlayer(8*w,  h,1));
    players.push(new AIPlayer(8*w,8*h,1));
    players.push(new AIPlayer(  w,8*h,1));

    var k:Int = 1;
    for (player in players) {
      add(player);
      add(new Score(9*w, k*h, player));
      k += 2;
    }

    add(new Wall(0, 0, 9*w, 5));
    add(new Wall(0, 0, 5, 10*h));
    add(new Wall(9*w-5, 0, 5, 10*h));
    add(new Wall(0, 10*h-5, 9*w-5, 5));
  }

  override public function begin() {
    for (player in players) {
      for (target in players) {
        if (target == player)
          continue;
        player.addTarget(target, 150 + 100*Math.random());
      }
    }
  }

}
