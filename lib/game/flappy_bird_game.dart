// ignore_for_file: unnecessary_overrides

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_birds_game/class/config.dart';
import 'package:flappy_birds_game/components/background.dart';
import 'package:flappy_birds_game/components/ground.dart';
import 'package:flappy_birds_game/components/pipe_group.dart';
import 'package:flutter/material.dart';

import '../components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval,
      repeat: true); //belirlenen limit ile tekrarla engel eklendi.
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground(), bird = Bird(), score = buildScore()]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        text: 'Score 0',
        position: Vector2(size.x / 2, size.y / 2 - 0.2),
        anchor: Anchor.center,
        textRenderer:
            TextPaint(style: const TextStyle(fontWeight: FontWeight.bold)));
  }

  @override
  void onTap() async {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) async {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}'; //Score güncellenmesi için
  }
}
