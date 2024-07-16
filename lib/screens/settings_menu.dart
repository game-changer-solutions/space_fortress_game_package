import 'package:flutter/material.dart';
import 'package:space_fortress_game_package/game/settings.dart';
import 'package:space_fortress_game_package/language_constants.dart';

import '../theme/app_theme.dart';

Settings settings = Settings();

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.apptheme,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  translation(context).settings,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    shadows: [
                      Shadow(
                        blurRadius: 40.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              SwitchListTile(
                  title: Text(
                    translation(context).soundsEffects,
                    style: const TextStyle(color: Colors.white),
                  ),
                  value: settings.soundEffects,
                  onChanged: (newValue) {
                    setState(() {
                      settings.soundEffects = newValue;
                    });
                  }),
              // SwitchListTile(
              //     title: const Text("Background Music"),
              //     value: settings.backgroundMusic,
              //     onChanged: (newValue) {
              //       setState(() {
              //         settings.backgroundMusic = newValue;
              //       });
              //     }),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
