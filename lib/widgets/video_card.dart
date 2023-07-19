import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        width: double.infinity,
        height:450,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}