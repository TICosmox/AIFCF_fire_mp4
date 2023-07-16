// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:file_picker/file_picker.dart';

// class ConfiguracionesArchivosPage extends StatefulWidget {
//   const ConfiguracionesArchivosPage({super.key});

//   @override
//   State<ConfiguracionesArchivosPage> createState() => _ConfiguracionesArchivosPageState();
// }

// class _ConfiguracionesArchivosPageState extends State<ConfiguracionesArchivosPage> {
//   String _rutaSeleccionada = '';
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//         title: Text('Configuración de Ruta'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 List<Directory>? externalDirs = await getExternalStorageDirectories();
//                 Directory externalDir = externalDirs!.first; // Selecciona el primer directorio de almacenamiento externo
//                 setState(() {
//                   _rutaSeleccionada = externalDir.path;
//                 });
//               },
//               child: Text('Obtener Ruta'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Ruta seleccionada: $_rutaSeleccionada',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 FilePickerResult? result = await FilePicker.platform.pickFiles();
//                 if (result != null) {
//                   String? ruta = result.files.single.path;
//                   setState(() {
//                     _rutaSeleccionada = ruta!;
//                   });
//                 }
//               },
//               child: Text('Seleccionar Archivo'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }