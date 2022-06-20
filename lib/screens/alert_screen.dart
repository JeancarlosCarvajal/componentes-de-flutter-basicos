import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // libreria IOS
class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false, // en true cierra dialago con click fuera dialago
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Este es el Contenido de la Alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), //   
              child: const Text('Cancelar', style: TextStyle(color: Colors.red))
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), //   
              child: const Text('Ok')
            ),
          ],
        );
      }

    );
  }

  void displayDialogAndroid(BuildContext context){
    // print('Hola Mundo');
    showDialog(
      barrierDismissible: true, // para poder cerrar el dialogo dando click en la sombra
      context: context, 
      builder: (context){
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Este es el Contenido de la Alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), //   
              child: const Text('Cancelar')
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), //   
              child: const Text('Ok')
            ),
          ],
        );
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
          //  style: ElevatedButton.styleFrom(
          //    primary: Colors.indigo,
          //    shape: const StadiumBorder(),
          //    elevation: 0
          //  ),
          //  onPressed: () => displayDialogAndroid(context), 
          //  onPressed: () => displayDialogIOS(context),
          //  style: ElevatedButton.styleFrom(
          //    primary: Colors.indigo,
          //    shape: const StadiumBorder(),
          //    elevation: 0
          //  ),
           onPressed: () => Platform.isIOS // verifica plataforma donde estoy 
            ? displayDialogIOS(context)
            : displayDialogAndroid(context),
           child: const Padding(
             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
             child: Text('Mostrar Alerta', style: TextStyle(fontSize: 16)),
           ), 
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: (){
          Navigator.pop(context); // context me bota a la ultima pagina donde estaba
        }
      ),
    );
  }
}