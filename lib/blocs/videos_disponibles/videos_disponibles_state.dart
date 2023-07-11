part of 'videos_disponibles_bloc.dart';


class VideosDisponiblesState<T> {
  final REACT_VIDEOS_DISPONIBLES? react;
  List<ModeloVideo>? listaVideosDisponibles;

  VideosDisponiblesState(
      {this.react,
      this.listaVideosDisponibles});

  VideosDisponiblesState<T> copyWith(VideosDisponiblesState state, {REACT_VIDEOS_DISPONIBLES? react, List<ModeloVideo>? listaVideosDisponibles}) =>
    VideosDisponiblesState<T>(react: react ?? state.react, listaVideosDisponibles: listaVideosDisponibles ?? state.listaVideosDisponibles);
}

class Loading extends VideosDisponiblesState<Loading> {}

class Issue extends VideosDisponiblesState<Issue> {}

class Success extends VideosDisponiblesState<Success> {}

// ignore: camel_case_types
enum REACT_VIDEOS_DISPONIBLES {
  initial,
  loading,
  postSuccess,
  getSuccess,
  updateSuccess,
  warning,
  success,
  error
}
