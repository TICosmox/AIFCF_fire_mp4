// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:proyecto_reproductor_video/constants/constants.dart';
import 'package:proyecto_reproductor_video/models/catalogo/catalgo.model.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';
part 'videos_disponibles_event.dart';
part 'videos_disponibles_state.dart';

class VideosDisponiblesBloc
  extends Bloc<VideosDisponiblesEvent, VideosDisponiblesState> {
      final LocalStorage? localStorage;
  VideosDisponiblesBloc(this.localStorage) : super(VideosDisponiblesState()) {
    on<GetVideosDisponibles>((event, emit) async {
      emit(Loading().copyWith(state, react: REACT_VIDEOS_DISPONIBLES.loading));
      await _getVideosDisponibles(emit);
    });
  }

  FutureOr<void> _getVideosDisponibles(
    Emitter<VideosDisponiblesState> emit) async {
    //leerArchivoJSONdesdeSDCARD();
    String? jsonResponse = await ConfigPaths().leerArchivoJSONdesdeSDCARD( localStorage!.nombreSD );
    //String jsonResponse = await rootBundle.loadString('assets/data/bd.json');
    List<ModeloVideo> listachida = modeloVideoFromJson(jsonResponse!);
    emit(Success().copyWith(state,
        listaVideosDisponibles: listachida,
        react: REACT_VIDEOS_DISPONIBLES.success));
  }
}
