import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/videos_disponibles/videos_disponibles_bloc.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import 'package:proyecto_reproductor_video/models/catalogo/catalgo.model.dart';
import 'package:proyecto_reproductor_video/utils/functions_utils.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

import '../../constants/constants.dart';

class VideosDisponiblesPage extends StatefulWidget {
  const VideosDisponiblesPage({super.key});

  @override
  State<VideosDisponiblesPage> createState() => _VideosDisponiblesPageState();
}

class _VideosDisponiblesPageState extends State<VideosDisponiblesPage> {
  bool cargando = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosDisponiblesBloc, VideosDisponiblesState>(
        listener: (context, state) {
          debugger();
      if (state.react == REACT_VIDEOS_DISPONIBLES.loading) {}
      if (state.react == REACT_VIDEOS_DISPONIBLES.success) {
        print(state.listaVideosDisponibles);
      }
      if (state.react == REACT_VIDEOS_DISPONIBLES.error) {}
    }, builder: (context, state) {
      return (state.listaVideosDisponibles != null)
          ? (state.listaVideosDisponibles!.isNotEmpty)
              ? _carga(state.listaVideosDisponibles!)
              : const Scaffold(body: Center(child: CircularProgressIndicator()))
          : const Scaffold(body: Center(child: CircularProgressIndicator()));
    });
  }

  Widget _carga(List<ModeloVideo> lista) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      extendBodyBehindAppBar: false,
      extendBody: true,
      appBar: CustomAppbar(),
      body: _body(lista),
    );
  }

  Widget _body(List<ModeloVideo> videos) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Todos los videos de cursos
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Todos los cursos disponibles',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              itemBuilder: (_, index) {
                return InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              print(videos[index]);
                              if(videos[index].video == null || videos[index].duracion == null ){
                                showAlert(context, tituloVacio, TYPE_ALERT.error);
                                return;
                              }
                              Navigator.pushNamed(
                                context, detallesvideos,
                                arguments: videos[index]
                              );
                            }
                            
                            
                            
                            ,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage(
                                placeholder: const AssetImage( 'assets/images/novideo.png'),
                                // TODO validar si la imagen existe
                                image: AssetImage(
                                    'assets/images/snapshot/${videos[index].nombreImagen}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(videos[index].titulo!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, detallevideo);
                  },
                );
              })
        ],
      ),
    );
  }
}
