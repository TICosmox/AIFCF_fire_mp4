import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import 'package:proyecto_reproductor_video/models/catalogo/catalgo.model.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';

class DetalleVideoPage extends StatelessWidget {
  const DetalleVideoPage({super.key});
  @override
  Widget build(BuildContext context) {

    ModeloVideo arguments = ModalRoute.of(context)!.settings.arguments as ModeloVideo;
    final path = Directory("${LocalStorage().nombreSD}/$carpetacontenedor/${arguments.nombreImagen}");
    File imagen = File(path.path);

    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text( arguments.titulo!),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.file(imagen ,fit: BoxFit.cover),
              //child: Image.asset('assets/images/snapshot/${arguments.nombreImagen}',fit: BoxFit.cover),
              //final path = Directory("${LocalStorage().nombreSD}/$carpetacontenedor/${widget.videoUrl}");
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Ink(
                        decoration: const ShapeDecoration(
                          color: Color.fromRGBO(100, 181, 246, 1),
                          shape: CircleBorder()
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          iconSize: 56,
                          tooltip: 'Reproducir',
                          onPressed: (){
                            Navigator.pushNamed(context, reproductordevideo, arguments: arguments.video);
                          },
                        ),
                      ),
                      const SizedBox(width: 50),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color.fromRGBO(100, 181, 246, 1),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.replay),
                          iconSize: 56,
                          tooltip: 'Volver a empezar',
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),

                  const Text( "Descripción", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ),
                  const SizedBox(height: 8),
                  Text(  arguments.descripcion!, style: const TextStyle(fontSize: 16) ),
                  const SizedBox(height: 16),
                  Text( arguments.ponente!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Maestro',style: TextStyle(fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
