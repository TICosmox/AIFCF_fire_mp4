import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';

import '../api/valida_pagina_inicial/valida_pagina_inicial_api.dart';
import '../blocs/valida_pagina_inicial/validacion_pagina_inicial_bloc.dart';
import '../blocs/validation_bloc/validation_bloc.dart';

Future<List<BlocProvider>> listBlocProvider() async {
  return [
     BlocProvider<ValidacionPaginaInicialBloc>(
      create: (context) => ValidacionPaginaInicialBloc(
        LocalStorage(),
      )..add(GetCargaInicial()),     
    ),

    //  BlocProvider<VersionBloc>(
    //     create: (context) =>
    //         VersionBloc(VersionRepository())),
  ];
}