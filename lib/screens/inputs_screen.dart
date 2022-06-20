import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView( 
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [

              TextFormField( // ventaja tiene mas eleemtnos para validar 
                // autofocus: false, // tenia true
                initialValue: 'Jeancarlos carvajal',
                textCapitalization: TextCapitalization.words, // me deja capitalizada la primera letra por default
                onChanged: (value){
                  // print('Valor: $value');
                },
                validator: (value){
                  if(value == null) return 'Este campo es requerido';
                  return value.length < 3 ? 'Minimo 3 letras' : null;
                  // si regresa null el mensjae de error se elimina
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Nombre del Usuario', // placehilder
                  labelText: 'Nombre', // nombre etiqueta
                  helperText: 'Solo letras',
                  // counterText: '3 Caracteres',
                  // prefixIcon: Icon(Icons.verified_user_outlined),
                  suffixIcon: Icon(Icons.group_add_outlined),
                  icon: Icon(Icons.assignment_ind_outlined),
                  focusedBorder: OutlineInputBorder( // si uso esto pierdo la forma en los border radius de abajo
                    borderSide: BorderSide(
                      color: Colors.green
                    )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                  )
                  )
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}