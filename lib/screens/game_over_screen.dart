import 'package:flappy_birds_game/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

import '../game/assets.dart';

class GameOverScreen extends StatelessWidget {
  static const String id = 'gameOver';
  final FlappyBirdGame game;
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: onRestart,
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
