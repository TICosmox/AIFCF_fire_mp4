part of 'validacion_pagina_inicial_bloc.dart';

class ValidacionPaginaInicialState<T> {
  final REACT_VALIDACION_PAGINA_INICIAL? react;
  bool? update;

  ValidacionPaginaInicialState(
      {this.react,
      this.update});

  ValidacionPaginaInicialState<T> copyWith(ValidacionPaginaInicialState state,
          {REACT_VALIDACION_PAGINA_INICIAL? react,
          bool? update}) =>
      ValidacionPaginaInicialState<T>(
          react: react ?? state.react,
          update: update ?? state.update);
}

class Loading extends ValidacionPaginaInicialState<Loading> {}

class Issue extends ValidacionPaginaInicialState<Issue> {}

class Success extends ValidacionPaginaInicialState<Success> {}

// ignore: camel_case_types
enum REACT_VALIDACION_PAGINA_INICIAL {
  initial,
  loading,
  postSuccess,
  getSuccess,
  updateSuccess,
  warning,
  success
}
