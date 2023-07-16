import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._internal();
  late SharedPreferences _local;
  static final LocalStorage _localStorage = LocalStorage._internal();
  factory LocalStorage() => _localStorage;
  initPrefs() async {
    _local = await SharedPreferences.getInstance();
  }

  String get rutamenu => _local.getString('rutamenu') ?? '';
  String get sistemaOperativo => _local.getString('sistemaOperativo') ?? '';
  String get userToken => _local.getString('userToken') ?? '';
  String get usuario => _local.getString('usuario') ?? '';
  String get nombreSD => _local.getString('nombreSD') ?? '';

  set rutamenu(String value) => _local.setString('rutamenu', value);
  set sistemaOperativo(String value) => _local.setString('sistemaOperativo', value);
  set userToken(String value) => _local.setString('userToken', value);
  set usuario(String value) => _local.setString('usuario', value);
  set nombreSD(String value) => _local.setString('nombreSD', value);

  void limpiarLocalStorage() {
    rutamenu = "";
    sistemaOperativo = "";
    userToken = "";
    usuario = "";
    nombreSD = "";
  }
}
