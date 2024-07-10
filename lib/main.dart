import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_fortress_game_package/init.dart';
import 'package:space_fortress_game_package/language_constants.dart';
import 'package:space_fortress_game_package/screens/main_menu.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    Flame.device.fullScreen();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Space Fortress",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        // brightness: Brightness.dark,
        fontFamily: "BungeeInline",
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: false,
        colorScheme: integrationInitialized && primaryColor != null
            ? ColorScheme.fromSeed(seedColor: primaryColor!)
            : null,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: integrationInitialized && primaryColor != null
                ? primaryColor!
                : null,
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor:
              WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return integrationInitialized && primaryColor != null
                  ? primaryColor!
                  : null;
            }
            return null;
          }),
          trackColor:
              WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return integrationInitialized && primaryColor != null
                  ? primaryColor!.withOpacity(0.7)
                  : null;
            }
            return integrationInitialized && primaryColor != null
                ? primaryColor!.withOpacity(0.3)
                : null;
          }),
        ),
      ),
      home: const MainMenu(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: integrationInitialized && localName != null
          ? Locale(localName!)
          : _locale,
      theme: ThemeData(
        fontFamily: "BungeeInline",
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: false,
        colorScheme: integrationInitialized && primaryColor != null
            ? ColorScheme.fromSeed(seedColor: primaryColor!)
            : null,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: integrationInitialized && primaryColor != null
                ? primaryColor!
                : null,
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor:
              WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return integrationInitialized && primaryColor != null
                  ? primaryColor!
                  : null;
            }
            return null;
          }),
          trackColor:
              WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return integrationInitialized && primaryColor != null
                  ? primaryColor!.withOpacity(0.7)
                  : null;
            }
            return integrationInitialized && primaryColor != null
                ? primaryColor!.withOpacity(0.3)
                : null;
          }),
        ),
      ),
      // themeMode: integrationInitialized && themeMode != null
      //     ? themeMode
      //     : ThemeMode.light,
    );
  }
}
