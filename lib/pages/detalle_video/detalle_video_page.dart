import 'package:flutter/material.dart';

import '../../constants/rutas_de_paginas.dart';

class DetalleVideoPage extends StatelessWidget {
  const DetalleVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Prueba de Sangre"),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset('assets/images/snapshot/pruebadesangre.png',fit: BoxFit.cover),
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
                            Navigator.pushNamed(context, reproductordevideo, arguments: "assets/videos/pruebadesangre.mp4");
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
                  const Text(
                    'El Maetro Carlos Carriedo Rico, demostrando como realizar pruebas de sangre con el metodo Kastle-Meyer',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text('Carlos Carriedo Rico', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
