
import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart'; 


class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( // AppBar no puede ser constante porque depende del tamano del dispositivo
      appBar: AppBar(
        title: const Center(child: Text('Card Widget'))
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [

          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(name: 'Avocado Saludable', imageUrl: 'https://healthybelleza.com/img/en/avocado-cut-in-a-half-88-1.webp',),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://healthybelleza.com/img/en/beautiful-skin-woman-91-1.webp',),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://healthybelleza.com/img/en/woman-cleaning-face-93-1.webp',),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://healthybelleza.com/img/en/cup-of-tea-for-losing-weight-87-1.webp',),
          SizedBox(height: 100), 
           

        ],
      ),
    );
  }
}
