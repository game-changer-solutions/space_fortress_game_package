import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../game/game.dart';
import '../theme/app_theme.dart';
import '../widgets/overlays/game_over_menu.dart';
import '../widgets/overlays/pause_button.dart';
import '../widgets/overlays/pause_menu.dart';

class GamePlay extends StatelessWidget {
  GamePlay({Key? key}) : super(key: key);

  final SpaceFortressGame _spaceFortress = SpaceFortressGame();

  @override
  Widget build(BuildContext context) {
    _spaceFortress.context = context;
    return Theme(
      data: AppTheme.apptheme,
      child: Scaffold(
        body: PopScope(
          canPop: false,
          child: GameWidget(
            game: _spaceFortress,
            initialActiveOverlays: const [PauseButton.id],
            overlayBuilderMap: {
              PauseButton.id:
                  (BuildContext context, SpaceFortressGame gameRef) =>
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
      ),
    );
  }
}
