import 'dart:convert';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:file_manager/controller/file_manager_controller.dart';
import 'package:file_manager/file_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';

class UriApi {
  static String uriAA = '';
  static String uriCosmox = '';
  static String key = "";
}


Future<bool> _requestExternalStoragePermission() async {
  if (await Permission.storage.request().isGranted) {
    return true;
  }
  return false;
}

Future<void> readSelectedJsonFile(String filePath) async {
  await FileManager.requestFilesAccessPermission();
  try {
    final file = File(filePath);

    if (await file.exists()) {
      final jsonString = await file.readAsString();
      final jsonData = jsonDecode(jsonString);

      // Utiliza los datos JSON según sea necesario
      // ...
    } else {
      print('El archivo seleccionado no existe.');
    }
  } catch (e) {
    print('Error al leer el archivo JSON: $e');
  }
}


Future<bool> leerArchivoJSONdesdeSDCARD() async {


//  try {
//     if (await _requestExternalStoragePermission()) {
//       final result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['json'],
//       );

//       if (result != null && result.files.isNotEmpty) {
//         final filePath = result.files.first.path;

//         if (filePath != null) {
//           await readSelectedJsonFile(filePath);
//         } else {
//           print('La ruta del archivo seleccionado es nula.');
//         }
//       } else {
//         print('No se seleccionó ningún archivo JSON.');
//       }
//     } else {
//       print('Permiso de lectura de almacenamiento externo denegado.');
//     }
//   } catch (e) {
//     print('Error al seleccionar el archivo JSON: $e');
//   }

  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  await FileManager.requestFilesAccessPermission();
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  List<String> paths;
  // getExternalStorageDirectories() will return list containing internal storage directory path
  // And external storage (SD card) directory path (if exists)
  paths = await ExternalPath.getExternalStorageDirectories();

  final path = Directory("${paths[1]}/$carpetacontenedor/$nombrearchivo");
  String documentPath = documentDirectory.path;
  File file = File(path.path);
  if (await file.exists()) {
    try {
      String jsonString = await file.readAsString();
    } catch (e) {
       print(e);
    }
  } else {
    print('El archivo JSON no existe en la memoria externa.');
    return false;
  }
  return true;
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

class FuncionalidadesAndroid {}

const String tituloAplicacion = 'AIFCF Conocer';
const String tituloVacio = "No se encontro registro";
