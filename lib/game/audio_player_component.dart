import 'dart:developer';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import '../screens/settings_menu.dart';

class AudioPlayerComponent extends Component {
  late AudioPool fire;
  late AudioPool killPlayer;
  late AudioPool bonus;
  late AudioPool killFortress;

  @override
  Future<void>? onLoad() async {
    try {
      FlameAudio.bgm.initialize();
      await FlameAudio.audioCache.loadAll([
        "laser.ogg",
        "laserSmall.ogg",
        "success_bell-6776.mp3",
        "medium-explosion-40472.mp3",
        // "SpaceInvaders.wav",
      ]).then((value) async {
        try {
          fire = await AudioPool.createFromAsset(
              path: "audio/laserSmall.ogg", maxPlayers: 9999999);

          killPlayer = await AudioPool.createFromAsset(
              path: "audio/laser.ogg", maxPlayers: 9999999);
          bonus = await AudioPool.createFromAsset(
              path: "audio/success_bell-6776.mp3", maxPlayers: 9999999);
          killFortress = await AudioPool.createFromAsset(
              path: "audio/medium-explosion-40472.mp3", maxPlayers: 9999999);
        } catch (e) {
          log(e.toString());
        }
      });
    } catch (e) {
      log(e.toString());
    }
    return super.onLoad();
  }

  // void playBgm(String fileName) {
  //   if (settings.backgroundMusic) {
  //     FlameAudio.bgm.play(fileName);
  //   }
  // }

  void playSfx(String fileName) {
    if (settings.soundEffects) {
      // FlameAudio.play(fileName);
      try {
        switch (fileName) {
          case "laserSmall.ogg":
            fire.start();
            break;
          case "laser.ogg":
            killPlayer.start();
            break;
          case "success_bell-6776.mp3":
            bonus.start();
            break;
          case "medium-explosion-40472.mp3":
            killFortress.start();
            break;
          default:
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  // void stopBgm() {
  //   FlameAudio.bgm.stop();
  // }
}
