import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoReproductorPage extends StatefulWidget {
  final String videoUrl;
  const VideoReproductorPage({super.key, required this.videoUrl});

  @override
  State<VideoReproductorPage> createState() => _VideoReproductorPageState();
}

class _VideoReproductorPageState extends State<VideoReproductorPage> {
  late VideoPlayerController _controller;
  bool _estaReproduciendo = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _botonReproducirPausar() {
    setState(() {
      _estaReproduciendo = !_estaReproduciendo;
      if (_estaReproduciendo) {
        _controller.play();
      } else {
        _controller.pause();
      }
    });
  }

  _seekTo(Duration duracion) {
    setState(() {
      _controller.seekTo(duracion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: _botonReproducirPausar,
                icon:
                    Icon(_estaReproduciendo ? Icons.pause : Icons.play_arrow)),
            IconButton(
                onPressed: () =>
                    _seekTo(_controller.value.position - Duration(seconds: 10)),
                icon: Icon(Icons.fast_rewind)),
            IconButton(
                onPressed: () =>
                    _seekTo(_controller.value.position + Duration(seconds: 10)),
                icon: Icon(Icons.forward))
          ],
        )
      ],
    );
  }
}
