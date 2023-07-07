import 'package:flutter/material.dart';

class VideosDisponiblesPage extends StatefulWidget {
  const VideosDisponiblesPage({super.key});

  @override
  State<VideosDisponiblesPage> createState() => _VideosDisponiblesPageState();
}

class _VideosDisponiblesPageState extends State<VideosDisponiblesPage> {
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
            itemCount: 10,
              
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, 'detallesvideo', arguments: 'modelocurso'),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const FadeInImage(
                              placeholder: AssetImage('assets/images/novideo.png'),
                              image: NetworkImage('https://via.placeholder.com/200x200'),
                              fit: BoxFit.cover, 
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text( "Titulo del curso", style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
