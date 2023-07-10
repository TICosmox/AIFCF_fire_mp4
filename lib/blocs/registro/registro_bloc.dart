// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:proyecto_reproductor_video/models/registro/registro_modelo.dart';
import '../../providers/local_storage_provider.dart';

part 'registro_event.dart';
part 'registro_state.dart';

class RegistroBloc extends Bloc<RegistroEvent, RegistroState> {
  final LocalStorage? localStorage;
  RegistroBloc(this.localStorage) : super( RegistroState() ) {
    on<PostRegistro>((event, emit) async {
      emit(Loading().copyWith(state, react: REACT_REGISTRO.loading));
      await _postRegistro(event.model, emit);
    });
  }

  FutureOr<void> _postRegistro( ModeloRegistro? data, Emitter<RegistroState> emit) async {
    localStorage!.usuario = json.encode(data!.toJson());
    emit(Success().copyWith(state, react: REACT_REGISTRO.success));
  }
}
