import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// ignore: depend_on_referenced_packages
import 'package:chewie/chewie.dart';

class VideoReproductorPage extends StatefulWidget {
  final String videoUrl;
  const VideoReproductorPage({super.key, required this.videoUrl});
  
  @override
  State<VideoReproductorPage> createState() => _VideoReproductorPageState();
}

class _VideoReproductorPageState extends State<VideoReproductorPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  // final bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
      VideoPlayerController.asset(widget.videoUrl);
        //VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        fullScreenByDefault: true);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
