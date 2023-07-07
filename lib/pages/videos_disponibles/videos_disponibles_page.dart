import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';

class VideosDisponoblesPage extends StatefulWidget {
  const VideosDisponoblesPage({super.key});

  @override
  State<VideosDisponoblesPage> createState() => _VideosDisponoblesPageState();
}

class _VideosDisponoblesPageState extends State<VideosDisponoblesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: false,
      extendBody: true,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo_aifcf.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Popular shows section
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Todos los cursos disponibles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, detallevideo);
                  },
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/logo.jpg",
                              // popularShows[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Titulo del curso",
                          // popularShows[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
