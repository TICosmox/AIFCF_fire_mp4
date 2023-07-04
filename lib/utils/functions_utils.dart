import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<File> createFileOfPdfUrl(String urlPath) async {
  final url = urlPath;
  final filename = url.substring(url.lastIndexOf("/") + 1);
  var request = await HttpClient().getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = File('$dir/$filename');
  await file.writeAsBytes(bytes);
  return file;
}

Future sharedFiles({
  required File path,
  required String name,
  required String ext,
  required BuildContext context,
}) async {
  if (await _requestPermissions()) {
    final isSave = await savePath(path: '$name$ext', filePath: path);
    if (isSave) {
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      final String _path = '$documentPath/$name$ext';
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.shareFiles([_path],
        subject: name,
        text: 'Mi nuevo $name',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }
}

Future<bool> _requestPermissions() async {
  var permission = await Permission.storage.status;
  if (permission != PermissionStatus.granted) {
    Permission.storage.request();
  }
  return permission == PermissionStatus.granted;
}

Future<bool> savePath({String? path, required File filePath}) async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  String documentPath = documentDirectory.path;

  File file = File('$documentPath/$path');
  file.writeAsBytesSync(filePath.readAsBytesSync());
  return true;
}

bool isThemeModeLight(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge!.color ==
      const Color(0xFF182023);
}

String textTransform(String text) {
  String lower = text.toLowerCase();
  var splitText = lower.split(' ');
  String newText = '';

  splitText.forEach((element) {
    var cap = element[0].toUpperCase();
    newText = newText + cap + element.substring(1) + ' ';
  });
  return newText;
}

String upperLetter(String text) {
  String lower = text.toLowerCase();
  List<String> splitText = lower.split(' ');
  String letter1 = '';
  String letter2 = '';
  if (splitText.length == 1) {
    letter1 = splitText[0].substring(0, 1).toUpperCase();
  } else {
    letter1 = splitText[0].substring(0, 1).toUpperCase();
    letter2 = splitText[1].substring(0, 1).toUpperCase();
  }

  // ignore: unnecessary_brace_in_string_interps
  return '${letter1}${letter2}';
}

class UpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

void showAlert(BuildContext context, String? content, TYPE_ALERT type) {
  final snack = SnackBar(
    backgroundColor: type == TYPE_ALERT.success
      ? Theme.of(context).colorScheme.secondary
      : Colors.orange,
    duration: const Duration(seconds: 5),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          type == TYPE_ALERT.success ? Icons.check_circle : Icons.error_rounded,
          size: 24,
          color: Colors.white,
        ),
        const SizedBox( width: 8 ),
        Expanded(
          child: Text( content ?? '', style: const TextStyle(fontSize: 17, color: Colors.white),
        ))
      ],
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snack);
}

// ignore: camel_case_types
enum TYPE_ALERT {
  error,
  success,
}

String base64Encode(List<int> bytes) => base64.encode(bytes);

Uint8List? base64Decode(String url) => base64.decode(url);

Future openwhatsapp(BuildContext context, String numero, String mensaje) async {
  var whatsapp = "+52" + numero;
  var whatsappURlAndroid =
    "whatsapp://send?phone=" + whatsapp + "&text=" + mensaje;
  var whatappURLIos =
    "https://wa.me/$whatsapp?text=${Uri.parse("${mensaje}")}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(whatappURLIos)) {
      await launch(whatappURLIos, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("whatsapp no instalado")));
    }
  } else {
    // android , web
    if (await canLaunch(whatsappURlAndroid)) {
      await launch(whatsappURlAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("whatsapp no instalado")));
    }
  }
}

Future launchSocial(String url, String fallbackUrl) async {
  try {
    bool launched = await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);}
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}

bool coincideCURPyRFC(String curp, String rfc) {
  String fechacurp;
  String fecharfc;
  try {
    fechacurp = curp.substring(4, 10);
    fecharfc = rfc.substring(4, 10);

    if (fechacurp == fecharfc) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}