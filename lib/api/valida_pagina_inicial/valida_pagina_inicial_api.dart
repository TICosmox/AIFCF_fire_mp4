// ignore_for_file: unnecessary_new, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:proyecto_reproductor_video/providers/api_provider.dart';

import '../../models/validacion_pagina_inicial/validacion_pagina_inicial_model.dart';

class VersionRepository {
  Future<VersionModel> getVersion() async {
    try {
      ApiProvider _api = ApiProvider();
      final _platfort = Platform.isIOS ? 'ios' : 'android';
      final _version = Platform.isIOS ? '1.0.1' : '1.0.1';
      // final response = await _api.getRequest(
      //     UriApi.uriAA, '/VersionesMoviles/Version/$_version,$_platfort');
      VersionModel model = new VersionModel();
      model.id = '11.11.11';
      model.version = '1.0.0';
      model.so = 'android';
      model.url = '';
      model.activo = true;

      // final version = VersionModel.fromJson({response});
      final version = model;
      return version;
    } catch (e) {
      throw throw Exception("ERROR");
    }
  }
}
