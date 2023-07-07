import 'package:flutter/material.dart';

import '../../widgets/custom_imput_field.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> miFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': '',
      'matricula': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de alumno'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: miFormKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Intoduzca su nombre completo',
                  icon: Icons.assignment_ind_outlined,
                  formProperty: 'nombre',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
          
                CustomInputField(
                  labelText: 'Matrícula',
                  hintText: 'Ingrese su matrícula',
                  keyboardType: TextInputType.number,
                  icon: Icons.app_registration,
                  formProperty: 'matricula',
                  formValues: formValues
                ),
                const SizedBox(height: 30),
          
                ElevatedButton(
                  child: const SizedBox(
                    width: 280,
                    child: Center(child: Text('Registrar'))
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus( FocusNode());
                    if ( !miFormKey.currentState!.validate() ){
                      return;
                    }
                    // Guardar registro y deshabilitar registro
                    print(formValues);
                  },
                )
              ],
            ),
          ),
        ),
      )
   );
  }
}

