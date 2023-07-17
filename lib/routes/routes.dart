import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/detalle_video/detalle_video_page.dart';
import 'package:proyecto_reproductor_video/pages/inicio/inicio_page.dart';
import 'package:proyecto_reproductor_video/pages/inicio/modificar_registro.dart';
import 'package:proyecto_reproductor_video/pages/panel_inicial/panel_inicial.dart';
import 'package:proyecto_reproductor_video/pages/registro/registro_page.dart';
import 'package:proyecto_reproductor_video/pages/validacion_pagina_inicial/validacion_pagina_inicial.dart';
import 'package:proyecto_reproductor_video/pages/video_reproductor/reproductor_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_disponibles/videos_disponibles_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_pendientes/videos_pendientes_page.dart';

import '../constants/rutas_de_paginas.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
    detallesvideos: (BuildContext context) => const DetalleVideoPage(),
    detallevideo: (BuildContext context) => const DetalleVideoPage(),
    inicio: (BuildContext context) => const InicioPage(),
    modificarregistro: (BuildContext context) => const ModificarRegistro(),
    panelinicial: (BuildContext context) => const PanelInicialPage(),
    registro: (BuildContext context) => const RegistroPage(),
    reproductordevideo: (BuildContext context) => const ReproductoPage(),
    validacioninicial: (BuildContext context) => const ValidationUserPage(),
    videosdisponibles: (BuildContext context) => const VideosDisponiblesPage(),
    videospendientes: (BuildContext context) => const VideosPendientesPage(),
     // 'terminos': (BuildContext context) => TerminosPage(visible: true),
  };
}
