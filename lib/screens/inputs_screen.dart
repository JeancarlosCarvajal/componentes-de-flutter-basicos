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
          child: Form(
            key: myFormKey,
            child: Column(
              children:  [
          
                const CustomInputField(labelText: 'Nombre', hintText: 'Nombre de Usuario', ),
                const SizedBox(height: 30,),
          
                const CustomInputField(labelText: 'Apellido', hintText: 'Apellido de Usuario', ),
                const SizedBox(height: 30,),
          
                const CustomInputField(labelText: 'Correo', hintText: 'Correo de Usuario', keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 30,),
          
                const CustomInputField(labelText: 'Contrasena', hintText: 'Contrasena de Usuario', obscureText: true),
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
                    // Todo imprimir valor del formulario
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
