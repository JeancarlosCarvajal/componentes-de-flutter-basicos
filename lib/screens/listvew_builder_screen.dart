import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // el fondo negro cuando se sobre pase estire la pantalla en scroll en IOS
      body: MediaQuery.removePadding( // cree el nuevo widget en ListView para quitar el padding de arriba y abajo y se vea bien en IOS
        context: context,
        removeTop: true, 
        removeBottom: true,
        child: ListView.builder(
          itemCount: 10, // cantidad de imagenes que muestra en la lista de imagenes
          itemBuilder: (BuildContext context, int index){ // el index es como los contadores de un ciclo for, se le suma 1 porque arranca con cero
            // print(index); // para ver que tiene
            // print(context);
            return FadeInImage(
              width: double.infinity, // toma todo el ancho posbile
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300?image=${index + 1}'),
            );
            
          },
        ),
      ),
    );
  }
}