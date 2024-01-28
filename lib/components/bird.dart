// ignore_for_file: unnecessary_overrides

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_birds_game/class/config.dart';
import 'package:flutter/material.dart';
import '../game/assets.dart';
import '../game/bird_movement.dart';
import '../game/flappy_bird_game.dart';

//Bird sınıfını SpritegroudComponent sınıfından türeterek,kuşun hareketini kontrol eden BirdMovement enum'ını kullanırız.
class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();
  int score = 0;

//Sprite'ları yüklemek için kullanolşan onLoad metodu
  @override
  Future<void> onLoad() async {
    //Kuşun orta kanat çırpma durumu için sprite yüklenir.
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    //Kuşun yukarı kanat çırpma durumu için sprite yüklenir.
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    //Kuşun aşağı kanat çırpma durumu için sprite yüklenir.
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    //Kuşun boyutu belirlenir.
    size = Vector2(50, 40);
    //Kuşun başlangıç pozisyonunu belirler.
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    //Kuşun başlangıç durumu
    current = BirdMovement.middle;
    //Kuşun hareket durumlarına karşılık gelen spritelar bir map içinde tanımlanır.
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };

    add(CircleHitbox()); //bird alanının dairesel çevresi
  }

  @override
  void fly() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      onComplete: () => current = BirdMovement.down,
    ));
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
    debugPrint('Collision Detected');
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
  }

  @override
  void update(double dt) async {
    super.update(dt);
    position.y += Config.birdVelocity * dt; //kuşun tekrar başlaması
    if (position.y < 1) {
      gameOver();
    }
  }
}
