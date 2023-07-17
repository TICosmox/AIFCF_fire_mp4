import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

class VideosPendientesPage extends StatefulWidget {
  const VideosPendientesPage({super.key});

  @override
  State<VideosPendientesPage> createState() => _VideosPendientesPage();
}

class _VideosPendientesPage extends State<VideosPendientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text( "Concluidos", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold) ),
          ),
          // Horizontal list of featured content
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: 150,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detallesvideo', arguments: 'nombrecurso'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const FadeInImage(
                        placeholder: AssetImage("assets/images/logo.jpg"),
                        image: AssetImage('assets/images/snapshot/pruebadesangre.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Videos sin empezar
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text('Sin Empezar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                          onTap: () => Navigator.pushNamed(context, 'detallesvideo', arguments: 'nombrecurso'),
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
                    const Text( "Titulo del curso", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
