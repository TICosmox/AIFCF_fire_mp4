part of 'validacion_pagina_inicial_bloc.dart';

class ValidacionPaginaInicialState<T> {
  final REACT_VALIDACION_PAGINA_INICIAL? react;
  bool? registrado;

  ValidacionPaginaInicialState(
      {this.react,
      this.registrado});

  ValidacionPaginaInicialState<T> copyWith(ValidacionPaginaInicialState state,
          {REACT_VALIDACION_PAGINA_INICIAL? react,
          bool? registrado}) =>
      ValidacionPaginaInicialState<T>(
          react: react ?? state.react,
          registrado: registrado ?? state.registrado);
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
  success,
  error
}
