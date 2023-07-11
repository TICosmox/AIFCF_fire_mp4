import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/registro/registro_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/videos_disponibles/videos_disponibles_bloc.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';

import '../blocs/validacion_pagina_inicial/validacion_pagina_inicial_bloc.dart';

Future<List<BlocProvider>> listBlocProvider() async {
  return [
    BlocProvider<ValidacionPaginaInicialBloc>(
      create: (context) => ValidacionPaginaInicialBloc(
        LocalStorage(),
      )..add(GetCargaInicial()),
    ),
    BlocProvider<RegistroBloc>(
        create: (context) => RegistroBloc(LocalStorage())),
    BlocProvider<VideosDisponiblesBloc>(
        create: (context) => VideosDisponiblesBloc()),
  ];
}
