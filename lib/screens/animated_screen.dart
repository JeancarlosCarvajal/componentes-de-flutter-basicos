import 'package:flutter/material.dart';
import 'dart:math' show Random;

// Lo transformamos en un statefulwidget
class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width  = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadious = BorderRadius.circular(10);

  void changeShape(){
    // print('Hola');
    final random = Random(); 
    _width  = random.nextInt(150).toDouble() + 70;
    _height = random.nextInt(150).toDouble() + 70;
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), random.nextInt(255).roundToDouble());
    _borderRadious = BorderRadius.circular(random.nextInt(100).toDouble() + 10); 
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Animated Conatiner'),
      ),
      body: Center(
         child: Container(
           width: _width,
           height: _height,
          //  color: Colors.red, // no se puede usar colors y boxdecoration al mismo tiempo
           decoration: BoxDecoration(
             color: _color,
             borderRadius: _borderRadious
           ),
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_circle_outline, size: 35),
      ),
    );
  }
}