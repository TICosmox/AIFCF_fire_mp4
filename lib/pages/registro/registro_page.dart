import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/registro/registro_bloc.dart';
import 'package:proyecto_reproductor_video/blocs/videos_disponibles/videos_disponibles_bloc.dart';
import 'package:proyecto_reproductor_video/constants/rutas_de_paginas.dart';
import 'package:proyecto_reproductor_video/models/registro/registro_modelo.dart';
import 'package:proyecto_reproductor_video/theme_config/input_decoration.dart';
import 'package:proyecto_reproductor_video/utils/functions_utils.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  var nombreTextController = TextEditingController(text: '');
  var matriculaTextController = TextEditingController(text: '');

  final _keyForm = GlobalKey<FormState>();
  bool cargando = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistroBloc, RegistroState>(
        listener: (context, state) {
      if (state.react == REACT_REGISTRO.loading) {
        setState(() {
          cargando = true;
        });
      }
      if (state.react == REACT_REGISTRO.success) {
         setState(() {
          cargando = false;
        });
        showAlert(context, "Registro correcto", TYPE_ALERT.success);
        BlocProvider.of<VideosDisponiblesBloc>(context)
          .add(GetVideosDisponibles());
        Navigator.pushNamedAndRemoveUntil(
          context, panelinicial, (Route<dynamic> route) => false);
      }
      if (state.react == REACT_REGISTRO.error) {
         setState(() {
          cargando = false;
        });
        showAlert(context, "Mensaje del error", TYPE_ALERT.error);
      }
    }, builder: (context, state) {
      return Scaffold(
        
        appBar: CustomAppbar(),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _keyForm,
              child: body()),
          ),
        ),
      );
    });
  }

  Widget body() {
    return Column(
      children: [
        const Text(
          'Registro de usuario',
          style: TextStyle(
            color: Color.fromARGB(255, 13, 71, 161),
            height: 4,
            fontSize: 34,
          )
        ),

        const SizedBox(height: 60),
        inputNombre(),
        const SizedBox(height: 24),
        inputMatricula(),
        const SizedBox(height: 24),
        (!cargando) ? botonAceptar() : const Center(child: CircularProgressIndicator(),),
      ],
    );
  }

  Widget inputNombre() {
    return Container(
      decoration: InputDecorations.boxDecoration(),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: nombreTextController,
        keyboardType: TextInputType.name,
        decoration: InputDecorations.authLoginDecoration(
          hintText: "Intoduzca su nombre completo",
          labelText: "Nombre",
          prefixIcon: Icons.assignment_ind_outlined),
        validator: (value) {
          if (value==null || value.isEmpty){
            return 'Por favor ingrese su nombre completo';
          }
          return null;
        }),
    );
  }

  Widget inputMatricula() {
    return Container(
      decoration: InputDecorations.boxDecoration(),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: matriculaTextController,
        keyboardType: TextInputType.number,
        decoration: InputDecorations.authLoginDecoration(
          hintText: "Matrícula",
          labelText: "Ingrese su matrícula",
          prefixIcon: Icons.app_registration,),
        validator: (value) {
          if (value == null || value.isEmpty){
            return 'Ingrese su matrícula';
          }
          return null;
        }),
    );
  }

  Widget botonAceptar() {
    return ElevatedButton(
      child:
        const SizedBox(width: 280, child: Center(child: Text('Registrar'))),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        if (_keyForm.currentState!.validate()) {
          ModeloRegistro model = ModeloRegistro();
          model.nombrecompleto = nombreTextController.text;
          model.matricula = matriculaTextController.text;
          BlocProvider.of<RegistroBloc>(context).add(PostRegistro(model: model));
        }
        // Guardar registro y deshabilitar registro
      },
    );
  }
}

    //   final GlobalKey<FormState> miFormKey = GlobalKey<FormState>();

    //   final Map<String, String> formValues = {
    //     'nombre': '',
    //     'matricula': '',
    //   };

    //   return Scaffold(
    //       appBar: AppBar(
    //           title: Image.asset(
    //             'assets/images/logo_aifcf.png',
    //             fit: BoxFit.contain,
    //             height: 60,
    //           ),
    //           bottom: const PreferredSize(
    //             preferredSize: Size.fromHeight(20),
    //             child: Padding(
    //               padding: EdgeInsets.all(8.0),
    //               child: Text('Registro del alumno',
    //                   style: TextStyle(color: Colors.white)),
    //             ),
    //           )),
    //       drawer: const SideMenu(),
    //       body: SingleChildScrollView(
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //           child: Form(
    //             key: miFormKey,
    //             child: Column(
    //               children: [
    //                 const SizedBox(height: 60),
    //                 CustomInputField(
    //                   labelText: 'Nombre',
    //                   hintText: 'Intoduzca su nombre completo',
    //                   icon: Icons.assignment_ind_outlined,
    //                   formProperty: 'nombre',
    //                   formValues: formValues,
    //                 ),
    //                 const SizedBox(height: 30),
    //                 CustomInputField(
    //                     labelText: 'Matrícula',
    //                     hintText: 'Ingrese su matrícula',
    //                     keyboardType: TextInputType.number,
    //                     icon: Icons.app_registration,
    //                     formProperty: 'matricula',
    //                     formValues: formValues),
    //                 const SizedBox(height: 30),
    //                 ElevatedButton(
    //                   child: const SizedBox(
    //                       width: 280, child: Center(child: Text('Registrar'))),
    //                   onPressed: () {
    //                     FocusScope.of(context).requestFocus(FocusNode());
    //                     if (!miFormKey.currentState!.validate()) {
    //                       return;
    //                     }
    //                     // Guardar registro y deshabilitar registro
    //                     print(formValues);
    //                   },
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ));
    // }