import 'package:flutter/material.dart';

class VideosVistosPage extends StatefulWidget {
  const VideosVistosPage({super.key});

  @override
  State<VideosVistosPage> createState() => _VideosVistosPageState();
}

class _VideosVistosPageState extends State<VideosVistosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Image.asset('assets/images/logo_aifcf.png', fit: BoxFit.contain, height: 60,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: const Center(
        child: Text("Videos Completados"),
      ),
    );
  }
}