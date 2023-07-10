import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.movie_filter_outlined),
            title: const Text('Mis cursos'),
            onTap: (){
              Navigator.pushReplacementNamed(context, panelinicial);
            } 
          ),
          // ListTile(
          //   leading: const Icon(Icons.movie_rounded),
          //   title: const Text('Avances'),
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, videospendientes);
          //   }
          // ),
          ListTile(
            leading: const Icon(Icons.outbond_outlined),
            title: const Text('Exportar avances'),
            onTap: () {
              
            }
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_outlined),
            title: const Text('Perfil'),
            onTap: () {
              
            }
          ),

        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo_aifcf.png'),
          fit: BoxFit.fitWidth,
        ),
        color: Colors.blue,
      ),
      child: Container(),
    );
  }
}
