
class UriApi {
  static String uriAA = 'https://tedamoslana.com.mx:9980/v1/';
  static String uriCosmox = 'https://financialrs.azurewebsites.net/';
  static String key = "cd94ee0e9f2da03671ff7a2ee907b366";
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
