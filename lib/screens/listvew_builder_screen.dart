import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget { // era stateless y lo cambie
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  
  final List<int> ImagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();

  // Evento para leer el evento scroll
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
        // print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
        if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
          add5(); // esta funcion agrega 5 elementos al array ImagesIds
        }
      }
    );
  }

  void add5(){
    final lastId = ImagesIds.last;
    ImagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e) // esto agrega 5 elementos al array comenzando desde el ultimo que tenia
    );
    setState(() { });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // el fondo negro cuando se sobre pase estire la pantalla en scroll en IOS
      body: MediaQuery.removePadding( // cree el nuevo widget en ListView para quitar el padding de arriba y abajo y se vea bien
        context: context,
        removeTop: true, 
        removeBottom: true,
        child: ListView.builder( // cualquier widget que tenga scroll usa controller
          physics: const BouncingScrollPhysics(), // para que tenga el mismo efecto de IOS en Android cuando se llegue al final del scroll
          controller: scrollController, // cualquier widget que tenga scroll usa controller
          itemCount: ImagesIds.length, // cantidad de imagenes que muestra en la lista de imagenes
          itemBuilder: (BuildContext context, int index){ // el index es como los contadores de un ciclo for, se le suma 1 porque arranca con cero
            // print(index); // para ver que tiene
            // print(context);
            return FadeInImage(
              width: double.infinity, // toma todo el ancho posbile
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300?image=${ImagesIds[index]}'),
            );
            
          },
        ),
      ),
    );
  }
}