import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget { // era stateless y lo cambie
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  
  final List<int> ImagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  // Evento para leer el evento scroll
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
        // print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
        if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
          // add5(); // esta funcion agrega 5 elementos al array ImagesIds
          fetchData();
        }
      }
    );
  }

  Future fetchData() async {

    if( isLoading ) return; // si el fetchData es cargando todavia no hagas nada
    isLoading = true;
    setState(() { });
    // detener el proceso por 3 segundos
    await Future.delayed(const Duration(seconds: 3));

    // Luego de la espera cargar la adicion de 5 elementos mas al array para mostrar mas imagenes
    add5();
    // Setea luego de 3 segundos la variable a false para que arriba pueda entrar otra vez a recostruir la pantalla con setState
    isLoading = false;
    setState(() { });

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
    
    // El media query permite ver datos de tamano de ancho y alto de pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, // el fondo negro cuando se sobre pase estire la pantalla en scroll en IOS
      body: MediaQuery.removePadding( // cree el nuevo widget en ListView para quitar el padding de arriba y abajo y se vea bien
        context: context,
        removeTop: true, 
        removeBottom: true,
        child: Stack( // le agrege otro widget a ListView del tipo columna y lo renombre con Stack para que me muestre un elemento cuando se detenga el scroll
          children: [

            ListView.builder( // cualquier widget que tenga scroll usa controller
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


            Positioned(
              bottom: 40,
              left: (size.width*0.5) - 30, // 30 es la mitad de tamano del bicho de 60.. size.width*0.5 es para ver la mitad
              child: _loadingIcon()
            ), // era column y lo extrai de aqui con extract widget


          ],
        ),
      ),
    );
  }
}

class _loadingIcon extends StatelessWidget {
  const _loadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // color: Colors.white,// lo coloque en decoration debe ir adentro cuando hay decoration
      height: 60,
      width: 60,
      decoration: BoxDecoration( // decoration y color no pueden ir juntos, el color debe ir adentro del decoration
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle
      ), 
      child: const CircularProgressIndicator( color: AppTheme.primary,),
    );
  }
}