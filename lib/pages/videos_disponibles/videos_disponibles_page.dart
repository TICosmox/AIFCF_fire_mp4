import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

class VideosDisponiblesPage extends StatefulWidget {
  const VideosDisponiblesPage({super.key});

  @override
  State<VideosDisponiblesPage> createState() => _VideosDisponiblesPageState();
}

class _VideosDisponiblesPageState extends State<VideosDisponiblesPage> {

  List videos = [];

  loadJson() async{
    String jsonResponse = await rootBundle.loadString('assets/data/bd.json');
    var datos = json.decode(jsonResponse);
    setState(() {
      videos = datos;
      print(videos);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      loadJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: false,
      extendBody: true,
      appBar: CustomAppbar(),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Todos los videos de cursos
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text( 'Todos los cursos disponibles', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            
            itemCount: videos.length,              
              itemBuilder: ( _ , index) {
                return InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'detallesvideo', arguments:{
                              'video': videos[index]["video"],
                              'nombreImagen': videos[index]["nombreImagen"],
                              'descripcion': videos[index]["descripcion"],
                              'ponente': videos[index]["ponente"],
                            }),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage(
                                placeholder: const AssetImage('assets/images/novideo.png'),
                                // TODO validar si la imagen existe
                                image: AssetImage('assets/images/snapshot/${videos[index]["nombreImagen"]}'),
                                fit: BoxFit.cover, 
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text( videos[index]["titulo"] , style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, detallevideo);
                  },
                );
              }
          )
        ],
      ),
    );
  }
}
