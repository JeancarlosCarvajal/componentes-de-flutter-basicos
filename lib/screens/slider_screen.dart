import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
    // transfore a statefulwidget para ppoder redibujar el input slider
    double _sliderValue = 100;

    bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider && checks'),
      ),
      body: Column( // agrege in widget con control punto SingleChildScrollView para que me permita hcer scroll
         children: [
           Slider.adaptive ( // verificar siempre si tiene la opcion adpatative para mejorar experiencia en otros dispositivos como IOS
             min: 50,
             max: 400,
             activeColor: AppTheme.primary,
            // divisions: 10,
             value: _sliderValue, 
             onChanged: _sliderEnabled
              ?
              (value){
                //  print(value);
                _sliderValue = value;
                setState(() { }); 
              }
              : null
            ), 

            // Checkbox( // debo hacer lo mismo que _liderValue, crear arriba
            //   value: _sliderEnabled, 
            //   //  onChanged: null, // es desabilitado
            //   onChanged: (value){
            //     _sliderEnabled = value ?? true;
            //     setState(() { });
            //   }
            // ),

            // Switch(
            //   value: _sliderEnabled, 
            //   onChanged:  (value) => setState(() {_sliderEnabled = value;})
            // ),
            
            CheckboxListTile (
              activeColor: AppTheme.primary,
              title: const Text('Habilitar Slider'),
              value: _sliderEnabled,
              onChanged: (value) => setState(() {_sliderEnabled = value ?? true;})
            ),

            SwitchListTile.adaptive (
              activeColor: AppTheme.primary,
              title: const Text('Habilitar Slider'),
              value: _sliderEnabled, 
              onChanged:  (value) => setState(() {_sliderEnabled = value;})
            ),

            const AboutListTile(), // muestra una lista de toda la informacion de la aplicacion

            Expanded(
              child: SingleChildScrollView( // Aqui el scoll es localidao en el elemento parecido en html
                child: Image(
                  image: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTziSjZy1lhoKQaQ5mu8SlymX0hCPEQQQ4VcCKBqjSV3YYmWUMbIGqH1NvFFah13HBYO4&usqp=CAU'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ), 
            const SizedBox(height: 100,) // para que  deje espacio en el footer no se pegue del final
         ],
      ),
    );
  }
}