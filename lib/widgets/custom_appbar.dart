import 'package:flutter/material.dart';

class CustomAppbar extends AppBar{

  CustomAppbar({super.key}) : super(
    title: Image.asset(
      'assets/images/logo_aifcf.png',
      fit: BoxFit.contain,
      height: 60,
    ),
    backgroundColor:  const Color(0xFF3F5AA6),
    elevation: 0,
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(20),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Bienvenido', style: TextStyle(color: Colors.white)),
      ),
    )
  );
}