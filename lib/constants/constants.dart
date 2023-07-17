import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';

class UriApi {
  static String uriAA = '';
  static String uriCosmox = '';
  static String key = "";
}

class ConfigPaths {
  Future<String> obtenerNombreSD() async {
    List<String> paths;
    paths = await ExternalPath.getExternalStorageDirectories();
    if (paths.length > 1) {
      return paths[1];
    } else {
      return '';
    }
  }
  
  Future<String?> leerArchivoJSONdesdeSDCARD(String nombreSD) async {
    final path = Directory("$nombreSD/$carpetacontenedor/$nombrearchivo");
    File file = File(path.path);
    if (await file.exists()) {
      try {
        String jsonString = await file.readAsString();
        return jsonString;
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }

}

class Native {
  // static Future<String> pathDownload() async {
  //   if (Platform.isAndroid) {
  //     final pathAndroid =
  //         await AndroidExternalStorage.getExternalStoragePublicDirectory(
  //             DirType.downloadDirectory);
  //     final path = Directory("$pathAndroid/FinancieraRS");
  //     if ((await path.exists())) {
  //       return pathAndroid! + '/FinancieraRS';
  //     } else {
  //       path.create();
  //       return await pathDownload();
  //     }
  //   } else {
  //     return await getApplicationDocumentsDirectory()
  //         .then((value) => value.path);
  //   }
  // }
}

const String tituloAplicacion = 'AIFCF Conocer';
const String tituloVacio = "No se encontro registro";
