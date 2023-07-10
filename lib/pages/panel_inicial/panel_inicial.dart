import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';

import 'package:proyecto_reproductor_video/pages/videos_disponibles/videos_disponibles_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_pendientes/videos_pendientes_page.dart';

class PanelInicialPage extends StatefulWidget {
  const PanelInicialPage({super.key});

  @override
  State<PanelInicialPage> createState() => _PanelInicialPageState();
}

class _PanelInicialPageState extends State<PanelInicialPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        bottomNavigationBar: menu(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: 'Ir a Inicio',
          onPressed: (){
            Navigator.pushReplacementNamed(context, inicio);
          },
          child: const Icon(Icons.home, size: 40, color: Color.fromARGB(255, 13, 71, 161),),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [VideosDisponiblesPage(), VideosPendientesPage()],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: const Color(0xFF3F5AA6),
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        
        tabs: [
          // Tab(
          //   text: "Inicio",
          //   icon: Icon(Icons.home),
          // ),
          Tab(
            text: "Todos los vídeos",
            icon: Icon(Icons.movie_filter_outlined),
          ),
          Tab(
            text: "Avances",
            icon: Icon(Icons.movie_rounded),
          ),
        ],

      ),
    );
  }
}
