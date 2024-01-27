import 'package:flame/components.dart';
import '../game/assets.dart';
import '../game/bird_movement.dart';
import '../game/flappy_bird_game.dart';

//Bird sınıfını SpritegroudComponent sınıfından türeterek,kuşun hareketini kontrol eden BirdMovement enum'ını kullanırız.
class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  Bird();

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
  }
}
