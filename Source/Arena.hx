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
    players.push(new AIPlayer(9*w,  h,1));
    players.push(new AIPlayer(9*w,9*h,1));
    players.push(new AIPlayer(  w,9*h,1));

    for (player in players) {
      add(player);
    }
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
