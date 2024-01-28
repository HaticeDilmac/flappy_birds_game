// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_birds_game/class/config.dart';
import 'package:flappy_birds_game/game/assets.dart';
import 'package:flappy_birds_game/game/pipe_position.dart';

import '../game/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);

    size =
        Vector2(50, height); //x ekseninde 50 ike height değeri neyse o kalsın

    switch (pipePosition) {
      case PipePosition.top: //Ters olanı üst kısma yerleştir.
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom: //düz engeli alt kısma yerleştir.
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
