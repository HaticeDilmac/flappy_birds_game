import 'package:flame/components.dart';
import 'package:flappy_birds_game/game/pipe_position.dart';

import '../game/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required this.height, required this.pipePosition});
  @override
  final double height;
  final PipePosition pipePosition;
}
