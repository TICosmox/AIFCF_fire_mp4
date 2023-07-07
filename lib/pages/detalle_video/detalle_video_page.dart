import 'package:flutter/material.dart';

class DetallesVideoPage extends StatelessWidget {
  const DetallesVideoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final String video = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No se encontró video';

    return Scaffold(
      body: Center(
        child: Text( video ),
     ),
   );
  }
}