import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {

  String nombre = '';
  String matricula = '';

  loadJson() async{
    String jsonString = LocalStorage().usuario;
     Map<dynamic, dynamic>alumno = jsonDecode(jsonString);
    //var alumno = ModeloRegistro.fromJson(jsonResponse);
    nombre = alumno['nombrecompleto'];
    matricula = alumno['matricula'];
    print( 'Hola, ${alumno['nombrecompleto']}!' );
  }

    @override
    void initState(){
    super.initState();
    setState(() {
      loadJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: const SideMenu(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: 'Ir a los videos',
          onPressed: (){
             Navigator.pushReplacementNamed(context, panelinicial);
          },
          child: const Icon(Icons.play_arrow, size: 40, color: Color.fromARGB(255, 13, 71, 161),),
        ),

      body: ListView(
          padding: EdgeInsets.zero,
          children: [
            buildTop(),
            Column(
              children: [
                const SizedBox(height: 8),  
                Text( nombre , style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text( matricula, style: const TextStyle(fontSize: 20, color: Colors.black)),
                const SizedBox(height: 16),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  // margin: EdgeInsets.all(25),
                  padding: const EdgeInsets.all(40),
                  child: buildBienvenida()
                ),
              ],
            ),
          ]
        )
    );
  }

  Stack buildTop() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children:[
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 50),
          child: imagenCentral()),
        Positioned(
        top: 320 - perfilHeight /2,
        child: imagenPerfil()
      ),
      ],
    );
  }
}

Widget buildBienvenida() =>  RichText(
  overflow: TextOverflow.clip,
  text: const TextSpan(
    style: TextStyle( fontSize: 20, color: Colors.white),
    children: [
      TextSpan(
        text: '''
          Te damos la bienvenida al programa de capacitación remota "Nombre del programa" de la ACADEMIA INTERNACIONAL DE FORMACIÓN EN CIENCIAS FORENSES.

          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          ''',
      ),
    ],    
  ),
);

Widget imagenCentral() => ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child:   Container(
    color: Colors.grey,
    child:  Image.asset('assets/images/inicio.jpg', width: 300),
  ),
);

const double perfilHeight = 150;
Widget imagenPerfil() => CircleAvatar(
  radius: perfilHeight / 4,
  backgroundColor: Colors.grey.shade800,
  backgroundImage: const AssetImage('assets/images/avatar.jpg'),
);



