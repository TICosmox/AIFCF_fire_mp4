import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import 'package:proyecto_reproductor_video/models/catalogo/catalgo.model.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

class DetalleVideoPage extends StatelessWidget {
  const DetalleVideoPage({super.key});
  @override
  Widget build(BuildContext context) {

    ModeloVideo arguments = ModalRoute.of(context)!.settings.arguments as ModeloVideo;
    final path = Directory("${LocalStorage().nombreSD}/$carpetacontenedor/${arguments.nombreImagen}");
    File imagen = File(path.path);

    return Scaffold(
      appBar: CustomAppbar('Información del video'),
      body: SingleChildScrollView(
        child: Column(
          children: [        
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.file(imagen, width: double.infinity, fit: BoxFit.fill),
                Positioned(
                  bottom: 8,
                  child: Container(
                    child: botonesReproducir(context, arguments)
                  ),
                ),
              ]
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text( arguments.titulo!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Text( "Descripción:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ),
                  const SizedBox(height: 8),
                  Text(  arguments.descripcion!, style: const TextStyle(fontSize: 16) ),
                  const SizedBox(height: 16),
                  const Text('Maestro:',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text( arguments.ponente!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 40),
                  const Text( 'Todos los derechos reservados', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 9)) 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row botonesReproducir(BuildContext context, ModeloVideo arguments) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor:  const Color.fromRGBO(100, 181, 246, 1),
          child: IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 36,
            color: Colors.black,
            tooltip: 'Reproducir',
            onPressed: (){
              Navigator.pushNamed(context, reproductordevideo, arguments: arguments.video);
            },
          ),
        ),
        const SizedBox(width: 40),
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color.fromRGBO(100, 181, 246, 1),
          child: IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 36,
            color: Colors.black,
            tooltip: 'Volver a empezar',
            onPressed: (){},
          )
        ),
      ],
    );
  }

}
