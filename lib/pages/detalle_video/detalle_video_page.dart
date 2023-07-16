import 'package:flutter/material.dart';

import '../../constants/rutas_de_paginas.dart';

class DetalleVideoPage extends StatelessWidget {
  const DetalleVideoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments  as Map;
    var video =  arguments['video'];
    var nombreImagen = arguments["nombreImagen"];
    var descripcion = arguments["descripcion"];
    var ponente = arguments["ponente"];
    print(arguments);

    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(descripcion),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset('assets/images/snapshot/$nombreImagen',fit: BoxFit.cover),
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
                            Navigator.pushNamed(context, reproductordevideo, arguments: "/storage/4CFA-082A/encriptado/videob.mp4");
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
                  Text(  descripcion , style: const TextStyle(fontSize: 16) ),
                  const SizedBox(height: 16),
                  Text( ponente, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
