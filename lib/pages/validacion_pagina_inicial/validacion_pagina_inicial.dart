import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/validacion_pagina_inicial/validacion_pagina_inicial_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/validation_bloc/validation_bloc.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import '../../utils/functions_utils.dart';

class ValidationUserPage extends StatefulWidget {
  const ValidationUserPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ValidationUserPageState createState() => _ValidationUserPageState();
}

class _ValidationUserPageState extends State<ValidationUserPage> {
  bool isUpdate = true;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final bool isVertical = orientation == Orientation.portrait;

    return Scaffold(
      body: BlocConsumer<ValidacionPaginaInicialBloc,
          ValidacionPaginaInicialState>(
        listener: (BuildContext _, ValidacionPaginaInicialState state) {
          // print(state.react);
          // print(state.registrado);
          if (state.react == REACT_VALIDACION_PAGINA_INICIAL.success) {
            if (state.registrado!) {
              Navigator.pushNamedAndRemoveUntil(
                context, inicio, (Route<dynamic> route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context, registro, (Route<dynamic> route) => false);
            }
          } else {
            showAlert(context, "Error", TYPE_ALERT.error);
          }
        },
        builder: (BuildContext _, ValidacionPaginaInicialState state) =>
          !isUpdate
            ? connectToBlocValidation(isVertical, context)
            : Center(
                child: Image(
                  height: 1000,
                  image: (isThemeModeLight(context)
                    ? const AssetImage('assets/images/logo.jpg')
                    : const AssetImage('assets/images/logo.jpg')),
                ),
              ),
      ),
    );
  }

  Widget connectToBlocValidation(bool isVertical, BuildContext context) {
    return BlocConsumer<ValidationBloc, ValidationState>(
        listener: (_, stValidation) {
      if (stValidation is ValidationLogin) {
        Navigator.pushNamedAndRemoveUntil(
            context, panelinicial, (Route<dynamic> route) => false);
      }
    }, builder: (BuildContext context, ValidationState stValidation) {
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(1, 158, 68, 1),
          image: DecorationImage(
            image: AssetImage("assets/images/logo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image(
            height: 2000,
            image: (isThemeModeLight(context)
                ? const AssetImage('assets/images/logo.jpg')
                : const AssetImage('assets/images/logo.jpg')),
          ),
        ),
      );
    });
  }
}
