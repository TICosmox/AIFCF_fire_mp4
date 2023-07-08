import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';

class DetalleVideoPage extends StatelessWidget {
  const DetalleVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: Image.network(
                'https://media.revistagq.com/photos/63e4f125df9a2fddd35516fc/16:9/pass/peliculas-disney-secuelas-toy-story-frozen.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Lógica que se ejecuta cuando se presiona el botón
                          Navigator.pushNamed(
                            context,
                            reproductordevideo,
                            arguments: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                          );
                        },
                        style: ButtonStyle(
                          // Personaliza el estilo del botón
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 30.0),
                          ),
                        ),
                        child: Text('Reproducir'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Lógica que se ejecuta cuando se presiona el botón
                          print('Continuar');
                        },
                        style: ButtonStyle(
                          // Personaliza el estilo del botón
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                          ),
                        ),
                        child: Text('Continuar Viendo'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Lógica que se ejecuta cuando se presiona el botón
                          print('Continuar');
                        },
                        style: ButtonStyle(
                          // Personaliza el estilo del botón
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                          ),
                        ),
                        child: Text('Ver desde el inicio'),
                      ),
                    ],
                  ),
                  Text(
                    "Descripcion",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'asgfgsdgadf',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Starring',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Actor',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
