import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/reproductor_video/reproductor_video_page.dart';

class DetallesVideoPage extends StatelessWidget {
  const DetallesVideoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const ReproductorVideo();

  //   final String video = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No se encontró video';
  //   return Scaffold(
  //     body: Center(
  //       child: Text( video ),
  //    ),
  //  );

  }
}
