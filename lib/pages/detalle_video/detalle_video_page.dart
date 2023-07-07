import 'package:flutter/material.dart';

class DetalleVideoPage extends StatelessWidget {
  const DetalleVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
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
                  Text('Actor', style: TextStyle(fontSize: 16),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
