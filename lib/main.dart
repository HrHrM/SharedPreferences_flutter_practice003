import 'package:flutter/material.dart';
import 'package:preferencias_usuarios_flutter/pages/home_page.dart';
import 'package:preferencias_usuarios_flutter/pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:preferencias_usuarios_flutter/global/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: 'home',
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
