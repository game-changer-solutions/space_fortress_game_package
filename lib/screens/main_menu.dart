import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_fortress_game_package/init.dart';
import 'package:space_fortress_game_package/language_constants.dart';
import 'package:space_fortress_game_package/main.dart';
import 'package:space_fortress_game_package/screens/game_play.dart';
import 'package:space_fortress_game_package/screens/settings_menu.dart';
import 'package:space_fortress_game_package/widgets/snack_bar.dart';

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
    InitApp.initializeApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    if (usernameInput.text == "" && !integrationInitialized) {
                      showSnackBar(
                          context, translation(context).usernameRequiredField);
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => GamePlay(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    translation(context).playButton,
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
              Text(
                "${translation(context).theCodeOfFoeMinesIs}\n${foeMinesCode.join(",")}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
