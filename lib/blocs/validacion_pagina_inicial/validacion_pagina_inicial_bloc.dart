// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:proyecto_reproductor_video/constants/constants.dart';
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

      String jsonResponse = await ConfigPaths().obtenerNombreSD();
      localStorage?.nombreSD = jsonResponse;
      // localStorage?.limpiarLocalStorage();
      if (data != "") {
        emit(Success()
          .copyWith(state, react: REACT_VALIDACION_PAGINA_INICIAL.success, registrado: true));
    } else {
        emit(Success()
          .copyWith(state, react: REACT_VALIDACION_PAGINA_INICIAL.success, registrado: false));
    }
  }
}
