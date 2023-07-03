// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:proyecto_reproductor_video/api/valida_pagina_inicial/valida_pagina_inicial_api.dart';

import '../../providers/local_storage_provider.dart';
part 'validacion_pagina_inicial_event.dart';
part 'validacion_pagina_inicial_state.dart';

class ValidacionPaginaInicialBloc extends Bloc<ValidacionPaginaInicialEvent, ValidacionPaginaInicialState> {
  final LocalStorage? localStorage;
  ValidacionPaginaInicialBloc(this.localStorage)
      : super(
          ValidacionPaginaInicialState(),
        ) {
    on<GetCargaInicial>((event, emit) async {
      await _getPaginaInicial(emit);
    });
  }

  FutureOr<void> _getPaginaInicial(Emitter<ValidacionPaginaInicialState> emit) async {
    emit(Success().copyWith(state, react: REACT_VALIDACION_PAGINA_INICIAL.success));
  }
}
