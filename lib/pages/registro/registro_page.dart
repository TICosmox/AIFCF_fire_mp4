import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/widgets/widgets.dart';

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
        title: Image.asset(
          'assets/images/logo_aifcf.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Registro del alumno', style: TextStyle(color: Colors.white)),
          ),
        )
      ),
      drawer: const SideMenu(),

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

