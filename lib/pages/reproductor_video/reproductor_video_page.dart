import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReproductorVideo extends StatefulWidget {
  const ReproductorVideo({super.key});

  @override
  State<ReproductorVideo> createState() => _ReproductorVideoState();
}

class _ReproductorVideoState extends State<ReproductorVideo> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.networkUrl( 
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     child: Column(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center, 
      //           children: [
      //             ElevatedButton(onPressed: (){ _controller.pause(); }, child: const Icon(Icons.pause)),
      //             const Padding(padding: EdgeInsets.all(2)),
      //             ElevatedButton(onPressed: (){ _controller.play(); }, child: const Icon(Icons.play_arrow)),
      //           ],
      //         ),
      //       ],
      //     ),
      //   )
      // ),

      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                // Si el VideoPlayerController ha finalizado la inicialización, usa
                // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Usa el Widget VideoPlayer para mostrar el vídeo
                    child: VideoPlayer(_controller),
                  ),
                  Text("Duración: ${_controller.value.duration}"),
                  VideoProgressIndicator (
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      backgroundColor: Colors.redAccent,
                      bufferedColor: Colors.black,
                      playedColor: Colors.blueAccent),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Envuelve la reproducción o pausa en una llamada a `setState`. Esto asegura 
          // que se muestra el icono correcto
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon( _controller.value.isPlaying ? Icons.pause : Icons.play_arrow ),
      ),

    );
  }
}