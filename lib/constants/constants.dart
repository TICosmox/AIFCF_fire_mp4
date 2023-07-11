
class UriApi {
  static String uriAA = '';
  static String uriCosmox = '';
  static String key = "";
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
