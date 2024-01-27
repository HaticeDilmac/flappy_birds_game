// ignore_for_file: unnecessary_overrides

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_birds_game/class/config.dart';

import '../game/assets.dart';
import '../game/flappy_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> {
  //Parallax örneğin scroll işlemlerinde effect uygulamak için kullanılır.Burada ise,
  //zeminin ilerlemesinde effect uygulamak için kullanıcaz.

  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images
        .load(Assets.ground); //ground resmini al ve grounda ata.
    parallax = Parallax([
      ParallaxLayer(ParallaxImage(ground, fill: LayerFill.none)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
//Zemin haraketsizdi ve bunu parallax ile haraketli hale getirdik :)
