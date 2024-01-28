import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_birds_game/class/config.dart';
import 'package:flappy_birds_game/components/pipe.dart';
import 'package:flappy_birds_game/game/flappy_bird_game.dart';
import 'package:flappy_birds_game/game/pipe_position.dart';
import 'package:flutter/material.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();
  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinutGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinutGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinutGround - spacing);
    addAll([
      Pipe(
        pipePosition: PipePosition.top,
        height: centerY - spacing / 2,
      ),
      Pipe(
        pipePosition: PipePosition.bottom,
        height: heightMinutGround - (centerY + spacing / 2),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
      debugPrint('Removed');
    }
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
  }
}
