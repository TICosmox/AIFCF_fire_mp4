part of 'registro_bloc.dart';

class RegistroState<T> {
  final REACT_REGISTRO? react;
  ModeloRegistro? data;

  RegistroState(
      {this.react,
      this.data});

  RegistroState<T> copyWith(RegistroState state, {REACT_REGISTRO? react, ModeloRegistro? data}) =>
    RegistroState<T>(react: react ?? state.react, data: data ?? state.data);
}

class Loading extends RegistroState<Loading> {}

class Issue extends RegistroState<Issue> {}

class Success extends RegistroState<Success> {}

// ignore: camel_case_types
enum REACT_REGISTRO {
  initial,
  loading,
  postSuccess,
  getSuccess,
  updateSuccess,
  warning,
  success,
  error
}
