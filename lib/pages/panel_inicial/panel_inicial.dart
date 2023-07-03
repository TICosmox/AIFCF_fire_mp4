import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/videos_disponibles/videos_disponibles_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_vistos/videos_vistos_page.dart';

class PanelInicialPage extends StatefulWidget {
  const PanelInicialPage({super.key});

  @override
  State<PanelInicialPage> createState() => _PanelInicialPageState();
}

class _PanelInicialPageState extends State<PanelInicialPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: const TabBarView(
            children: [VideosDisponoblesPage(), VideosVistosPage()],
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
            text: "Cursos Disponibles",
            icon: Icon(Icons.euro_symbol),
          ),
          Tab(
            text: "Cursos Tomados",
            icon: Icon(Icons.assignment),
          )
        ],
      ),
    );
  }
}
