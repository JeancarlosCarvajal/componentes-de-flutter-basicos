import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
   
  final String imageUrl;
  final String? name;
   
  const CustomCardType2({
    Key? key, 
    required this.imageUrl, 
    this.name
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // elimina los bordes
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      elevation: 10,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: [


          // Image(
          //   image: NetworkImage('https://nftlatinoamerica.com/meta-data/images/0x39777cdb18018f651ba9c71aa4a4d6c2775633313245f4a1f3475f7b94a2f7ed/63.png')
          // )

          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),

          if(name != null) 
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Text(name ?? 'No title')
          )


        ]
      ),
    );
  }
}