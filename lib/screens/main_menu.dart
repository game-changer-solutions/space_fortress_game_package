import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../init.dart';
import '../language_constants.dart';
import '../main.dart';
import 'game_play.dart';
import 'settings_menu.dart';
import '../theme/app_theme.dart';
import '../widgets/snack_bar.dart';

String getRandomChar() {
  return 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split("")[Random().nextInt(25)];
}

String firstChar = getRandomChar();
String secondChar = getRandomChar();
String thirdChar = getRandomChar();

List<String> foeMinesCode = [
  firstChar,
  secondChar == firstChar ? getRandomChar() : secondChar,
  thirdChar == firstChar || thirdChar == secondChar
      ? getRandomChar()
      : thirdChar
];

final usernameInput = TextEditingController();

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    Flame.device.fullScreen();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        }
      },
      child: Theme(
        data: AppTheme.apptheme,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: !integrationInitialized
              ? ElevatedButton(
                  onPressed: () async {
                    Locale locale = await setLocale(
                        translation(context).localeName == "en" ? "ar" : "en");
                    MyApp.setLocale(context, locale);
                  },
                  child: Text(translation(context).changeLanguage,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Roboto",
                      )),
                )
              : Container(),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      "Space Fortress",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                  Text(
                    "${translation(context).codeMines}\n${foeMinesCode.join(",")}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (!integrationInitialized)
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          iconColor: Colors.white,
                          labelText: translation(context).username,
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        controller: usernameInput,
                        style: const TextStyle(
                          fontFamily: "",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        if (usernameInput.text == "" &&
                            !integrationInitialized) {
                          showSnackBar(context,
                              translation(context).usernameRequiredField);
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => GamePlay(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        translation(context).play,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SettingsMenu(),
                          ),
                        );
                      },
                      child: Text(
                        translation(context).settings,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (integrationInitialized)
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          translation(context).exit,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
