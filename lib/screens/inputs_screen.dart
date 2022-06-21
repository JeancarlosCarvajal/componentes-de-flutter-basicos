import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Jeancarlos',
      'last_name' : 'Carvajal',
      'email'     : 'jeancarloscarvajalavila@gmail.com',
      'password'  : '123456',
      'role'      : 'admin',
    };

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView( 
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form( // este form sabe donde estan los trextformfields
            key: myFormKey,
            child: Column(
              children:  [
          
                CustomInputField(labelText: 'Nombre', hintText: 'Nombre de Usuario', formProperty: 'first_name', formValues: formValues, ),
                const SizedBox(height: 30,),
          
                CustomInputField(labelText: 'Apellido', hintText: 'Apellido de Usuario', formProperty: 'last_name', formValues: formValues, ),
                const SizedBox(height: 30,),
          
                CustomInputField(labelText: 'Correo', hintText: 'Correo de Usuario', keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues, ),
                const SizedBox(height: 30,),
          
                CustomInputField(labelText: 'Contrasena', hintText: 'Contrasena de Usuario', obscureText: true, formProperty: 'password', formValues: formValues, ),
                const SizedBox(height: 30,),
          
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))
                  ),
                  onPressed: (){
                    
                    // quita el focus donde se tenia el cursor
                    FocusScope.of(context).requestFocus(FocusNode()); 

                    if(!myFormKey.currentState!.validate()){
                      print('No valido');
                    }
                    // Imprimir valor del formulario
                    // Aqui los valores se envian con peticion https al servidor
                    print(formValues);
                    
                  }, 
                )
           
              ],
            ),
          ),
        ),
      ),

    );
  }
}
