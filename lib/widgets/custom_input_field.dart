import 'package:flutter/material.dart';


class CustomInputField extends StatelessWidget {

final String? hintText;
final String? labelText;
final String? helperText;
final IconData? icon;
final IconData? suffixIcon;
final TextInputType? keyboardType;
final bool? obscureText;

  const CustomInputField({
    Key? key, 
    this.hintText, 
    this.labelText, 
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField( // ventaja tiene mas eleemtnos para validar 
      // autofocus: false, // tenia true
      initialValue: '',
      textCapitalization: TextCapitalization.words, // me deja capitalizada la primera letra por default
      keyboardType: keyboardType, //era  TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      onChanged: (value){
        print('Valor: $value');
      },
      validator: (value){
        if(value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Minimo 3 letras' : null;
        // si regresa null el mensjae de error se elimina
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText, // placehilder
        labelText: labelText, // nombre etiqueta
        helperText: helperText,
        // counterText: '3 Caracteres',
        // prefixIcon: Icon(Icons.verified_user_outlined),
        suffixIcon: suffixIcon == null ? null : Icon( suffixIcon ),
        icon: icon == null ? null : Icon( icon ),
        // focusedBorder: OutlineInputBorder( // si uso esto pierdo la forma en los border radius de abajo
        //   borderSide: BorderSide(
        //     color: Colors.green
        //   )
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(10),
        //     topRight: Radius.circular(10),
        //   )
        // )
      ),
    );
  }
}