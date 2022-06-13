import 'package:flutter/material.dart';
import 'package:preferencias_usuarios_flutter/global/global.dart';
import 'package:preferencias_usuarios_flutter/widgets/menu_wiget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = prefs?.getInt('genero') ?? 1;
  String _nombre = prefs?.getString('nombre') ?? '';

  TextEditingController? _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: _nombre);
  }

  void _setSelectedRadio(int? valor) async {
    prefs?.setInt('genero', valor!);

    setState(() {
      _genero = valor!;
    });
  }

  void _setSelectedName(String? valor) async {
    prefs?.setString('nombre', valor!);

    setState(() {
      _nombre = valor!;
    });
  }

  void _setSelectedColor(bool valor) async {
    prefs?.setBool('color_secundario', valor);

    setState(() {
      _colorSecundario = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Ajustes',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: const Text('Colors secundario'),
            onChanged: _setSelectedColor,
          ),
          RadioListTile<int>(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: const Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: const Text('Femenino'),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona que usara el aplicativo',
              ),
              onChanged: _setSelectedName,
            ),
          ),
        ],
      ),
    );
  }
}
