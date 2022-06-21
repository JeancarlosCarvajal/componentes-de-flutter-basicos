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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider && checks'),
      ),
      body: SingleChildScrollView( // permite ahcer scrol cuando se sale de la pantalla 
        child: Column( // agrege in widget con control punto SingleChildScrollView para que me permita hcer scroll
           children: [
             Slider.adaptive ( // verificar siempre si tiene la opcion adpatative para mejorar experiencia en otros dispositivos como IOS
               min: 50,
               max: 400,
               activeColor: AppTheme.primary,
              // divisions: 10,
               value: _sliderValue, 
               onChanged: (value){
                 print(value);
                 _sliderValue = value;
                 setState(() { });
      
               }
              ),
              Image(
                image: const NetworkImage('https://healthybelleza.com/img/en/clay-on-face-90-0.webp'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
              const SizedBox(height: 30,),
              Image(
                image: const NetworkImage('https://healthybelleza.com/img/en/woman-cleaning-her-face-93-0.webp'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ), 
              const SizedBox(height: 30,),
              Image(
                image: const NetworkImage('https://healthybelleza.com/img/en/young-skin-woman-91-0.webp'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ), 
              const SizedBox(height: 100,) // para que  deje espacio en el footer no se pegue del final
           ],
        ),
      ),
    );
  }
}