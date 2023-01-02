import 'package:flutter/cupertino.dart';
import 'package:yaml/yaml.dart';

class Settings { // TODO: everything
  late final dynamic settingsMap;
  Settings._(); // hide default constructor

  static Future<Settings> load(BuildContext context) async {
    Settings s = Settings._();
    final yamlString = await DefaultAssetBundle.of(context).loadString('assets/config.yaml');
    s.settingsMap = loadYaml(yamlString);
    print(s);
    return s;
  }
}