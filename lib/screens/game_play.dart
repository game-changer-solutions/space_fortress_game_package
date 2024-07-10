import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_fortress_game_package/game/game.dart';
import 'package:space_fortress_game_package/widgets/overlays/game_over_menu.dart';
import 'package:space_fortress_game_package/widgets/overlays/pause_button.dart';
import 'package:space_fortress_game_package/widgets/overlays/pause_menu.dart';

class GamePlay extends StatelessWidget {
  GamePlay({Key? key}) : super(key: key);

  final SpaceFortressGame _spaceFortress = SpaceFortressGame();

  @override
  Widget build(BuildContext context) {
    _spaceFortress.context = context;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: _spaceFortress,
          initialActiveOverlays: const [PauseButton.id],
          overlayBuilderMap: {
            PauseButton.id: (BuildContext context, SpaceFortressGame gameRef) =>
                PauseButton(
                  gameRef: gameRef,
                ),
            PauseMenu.id: (BuildContext context, SpaceFortressGame gameRef) =>
                PauseMenu(
                  gameRef: gameRef,
                ),
            GameOverMenu.id:
                (BuildContext context, SpaceFortressGame gameRef) =>
                    GameOverMenu(
                      gameRef: gameRef,
                    ),
          },
        ),
      ),
    );
  }
}
