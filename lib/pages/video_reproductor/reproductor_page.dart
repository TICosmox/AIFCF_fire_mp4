import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/video_reproductor/video_page.dart';

class ReproductoPage extends StatelessWidget {
  const ReproductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String parametro = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      appBar: AppBar(title: Text("Reprodutor de video")),
      body: VideoReproductorPage(videoUrl: parametro),
    );
  }
}
