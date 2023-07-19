import 'package:flutter/material.dart';

class CustomAppbar extends AppBar{
final texto;
  
  CustomAppbar(this.texto, {super.key}) : super(
    backgroundColor:  const Color(0xFF3F5AA6),
    elevation: 0,
    title: Image.asset( 'assets/images/logo_aifcf.png', fit: BoxFit.contain, height: 60 ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(20),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text( texto, style: TextStyle(color: Colors.white)),
      ),
    )
  );
}