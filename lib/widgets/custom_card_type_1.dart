
import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';


class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:  [

          const ListTile(
            leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary), 
            title: Text('Soy un Titulo'),
            subtitle: Text('Esse sint mollit dolor officia. Sit  onsectetur ut dolore do. Eu eu esse mollit incididunt. Nostrud eiusmod culpa excepteur veniam commodo ex laborum velit nisi cupidatat do officia. Sit nostrud cillum deserunt aute cillum labore mollit exercitation aliquip mollit.', 
              textAlign: TextAlign.justify,
              style: TextStyle(height: 2.0),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){},
                  // style: TextButton.styleFrom(primary: Colors.indigo), // lo coloque en apptheme 
                  child: const Text('Cancel')
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Ok')
                )
              ],

            ),
          )



        ],
      )
    );
  }
}