import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/pages/detalle_video/detalle_video_page.dart';
import 'package:proyecto_reproductor_video/pages/panel_inicial/panel_inicial.dart';
import 'package:proyecto_reproductor_video/pages/video_reproductor/reproductor_page.dart';
import 'package:proyecto_reproductor_video/pages/registro/registro_page.dart';
import 'package:proyecto_reproductor_video/pages/reproductor_video/reproductor_video_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_disponibles/videos_disponibles_page.dart';
import 'package:proyecto_reproductor_video/pages/videos_pendientes/videos_pendientes_page.dart';

import '../constants/rutas_de_paginas.dart';
import '../pages/validacion_pagina_inicial/validacion_pagina_inicial.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
     panelinicial: (BuildContext context) => const PanelInicialPage(),
     videosdisponibles: (BuildContext context) => const VideosDisponiblesPage(),
     videospendientes: (BuildContext context) => const VideosPendientesPage(),
     detallevideo: (BuildContext context) => const DetalleVideoPage(),
     reproductordevideo: (BuildContext context) => const ReproductoPage(),
     validacioninicial: (BuildContext context) => const ValidationUserPage(),
     detallesvideos: (BuildContext context) => const DetalleVideoPage(),
     registro: (BuildContext context) => const RegistroPage(),
     reproductorvideo: (BuildContext context) =>  const ReproductorVideo(),
     // 'terminos': (BuildContext context) => TerminosPage(visible: true),
  };
}
