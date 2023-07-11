// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:proyecto_reproductor_video/models/catalogo/catalgo.model.dart';
part 'videos_disponibles_event.dart';
part 'videos_disponibles_state.dart';

class VideosDisponiblesBloc extends Bloc<VideosDisponiblesEvent, VideosDisponiblesState> {
  VideosDisponiblesBloc() : super( VideosDisponiblesState() ) {
    on<GetVideosDisponibles>((event, emit) async {
      emit(Loading().copyWith(state, react: REACT_VIDEOS_DISPONIBLES.loading));
      await _getVideosDisponibles(emit);
    });
  }

  FutureOr<void> _getVideosDisponibles(Emitter<VideosDisponiblesState> emit) async {
     String jsonResponse = await rootBundle.loadString('assets/data/bd.json');
    List<ModeloVideo> listachida = modeloVideoFromJson(jsonResponse);  
    emit(Success().copyWith(state, listaVideosDisponibles: listachida ,react: REACT_VIDEOS_DISPONIBLES.success));
  }
}