import 'package:flame/game.dart';
import 'package:flappy_birds_game/components/background.dart';
import 'package:flappy_birds_game/components/ground.dart';

import '../components/bird.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);
  }
}
