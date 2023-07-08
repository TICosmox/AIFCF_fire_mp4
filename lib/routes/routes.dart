import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/detalle_video/detalle_video_page.dart';
import 'package:proyecto_reproductor_video/pages/panel_inicial/panel_inicial.dart';
import 'package:proyecto_reproductor_video/pages/video_reproductor/reproductor_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_disponibles/videos_disponibles_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_pendientes/videos_pendientes_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_vistos/videos_vistos_page.dart';

import '../constants/rutas_de_paginas.dart';
import '../pages/validacion_pagina_inicial/validacion_pagina_inicial.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
     validacioninicial: (BuildContext context) => const ValidationUserPage(),
     panelinicial: (BuildContext context) => const PanelInicialPage(),
     videosdisponibles: (BuildContext context) => const VideosDisponoblesPage(),
     videosvistos: (BuildContext context) => const VideosVistosPage(),
     videospendientes: (BuildContext context) => const VideosPendientesPage(),
     detallevideo: (BuildContext context) => const DetalleVideoPage(),
     reproductordevideo: (BuildContext context) => const ReproductoPage()
  };
}
