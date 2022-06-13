import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:preferencias_usuarios_flutter/global/global.dart';
import 'package:preferencias_usuarios_flutter/widgets/menu_wiget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';
  final int _genero = prefs?.getInt('genero') ?? 1;
  final String _nombre = prefs?.getString('nombre') ?? '';
  final bool _color = prefs?.getBool('color_secundario') ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        title: const Text('Preferencias de usuario'),
        backgroundColor: _color ? Colors.teal : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario: $_color '),
          const Divider(),
          Text('Genero: $_genero '),
          const Divider(),
          Text('Nombre de Usuario: $_nombre'),
          const Divider(),
        ],
      ),
    );
  }
}
