import 'package:flutter/material.dart';

class VideosVistosPage extends StatefulWidget {
  const VideosVistosPage({super.key});

  @override
  State<VideosVistosPage> createState() => _VideosVistosPageState();
}

class _VideosVistosPageState extends State<VideosVistosPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Completados"),
      ),
    );
  }
}