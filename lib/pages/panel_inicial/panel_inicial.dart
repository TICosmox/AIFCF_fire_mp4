import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/registro/registro_page.dart';
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
        length: 3,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: const TabBarView(
            children: [VideosDisponoblesPage(), VideosPendientesPage(), RegistroPage(),],
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
          Tab(
            text: "Todos los vídeos",
            icon: Icon(Icons.movie_filter_outlined),
          ),
          Tab(
            text: "Avances",
            icon: Icon(Icons.movie_rounded),
          ),
          Tab(
            text: "Inicio",
            icon: Icon(Icons.home),
          ),
        ],

      ),
    );
  }
}
