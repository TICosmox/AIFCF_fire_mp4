// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../providers/local_storage_provider.dart';
part 'validacion_pagina_inicial_event.dart';
part 'validacion_pagina_inicial_state.dart';

class ValidacionPaginaInicialBloc
    extends Bloc<ValidacionPaginaInicialEvent, ValidacionPaginaInicialState> {
  final LocalStorage? localStorage;
  ValidacionPaginaInicialBloc(this.localStorage)
      : super(
          ValidacionPaginaInicialState(),
        ) {
    on<GetCargaInicial>((event, emit) async {
      await _getPaginaInicial(emit);
    });
  }

  FutureOr<void> _getPaginaInicial(
      Emitter<ValidacionPaginaInicialState> emit) async {
    String data = localStorage!.usuario;
    // localStorage?.limpiarLocalStorage();
    // ignore: unnecessary_null_comparison
    if (data != "") {
      emit(Success()
          .copyWith(state, react: REACT_VALIDACION_PAGINA_INICIAL.success, registrado: true));
    } else {
      emit(Success()
          .copyWith(state, react: REACT_VALIDACION_PAGINA_INICIAL.success, registrado: false));
    }
  }
}
