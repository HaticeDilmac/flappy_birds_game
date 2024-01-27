import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_birds_game/game/flappy_bird_game.dart';

import '../game/assets.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
//SpriteComponent haraketli imge yapmamızı sağlar.
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
