// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //statefulWidget para hacer pruebas locales sobre el contenedor
  @override
  _HomePageState createState() => _HomePageState();
}

/// Clase con todo el contenido de la pagina aplicacion
class _HomePageState extends State<HomePage> {
  /// lista de cada banda en modo diccionario,
  /// las deberia traer desde el backend
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 1),
    Band(id: '3', name: 'Heroes del silencio', votes: 2),
    Band(id: '4', name: 'Bon Jovi', votes: 3)
  ];



  /// Scaffold
  /// 
  /// Es el contenedor principal 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// appBar es la barra de arriba como titulo
      appBar: AppBar(
        title: const Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),

      /// Listview para que todo el cuerpo se comporte como una lista
      body: ListView.builder(
          itemCount: bands.length,

          /// Aqui se llama a la funcion bandTiles 
          itemBuilder: (context, i) => _bandTile(bands[i])
          
          ),
        
        /// floating añade un boton azul con un icono +
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        elevation: 1,
        onPressed:  addNewBand,
      ),
    );
  }

  /// LisTile
  /// 
  /// Trae las bandas [band] y las pone en un LisTile
  ListTile _bandTile(Band band) {
    return ListTile(

      /// Circle avatar para poner las dos primeras letras del nombre de la banda
      leading: CircleAvatar(
        child: Text(band.name.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      title: Text(band.name),
      trailing: Text('${band.votes}', style: const TextStyle(fontSize: 20)),
      onTap: () {
        print(band.name);
      },
    );
  }

  /// Se encarga de mostrar una pantalla emergente para que el usuario
  /// ingrese el nombre de una banda... Aun no se agrega a la lista
  /// detecta si es android o no
  addNewBand() {

    /// Este es el controlador para que funcione correctamente la ventana
    final textController = TextEditingController();
    

    if(Platform.isAndroid){
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New band name:"),
            content: TextField(
              controller:  textController,
            ),
            actions: <Widget>[
              MaterialButton(
                  child: const Text('Add'),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => addBandToList(textController.text)
                  
                  )
            ],
          );
        });
    }
    else if(Platform.isMacOS){
    showCupertinoDialog(
      context: context, 
      builder: (_){
        return CupertinoAlertDialog(
          title: const Text('New Band Name: '),
          content:  CupertinoTextField(
            controller: textController,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Add'),
              onPressed: ()=>addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Dismiss'),
              onPressed: ()=>Navigator.pop(context),
            )
          ],
        );
      }
      );
    }
  }

  /// Aqui se añade la banda al listado
  void addBandToList( String name){
    print(name);
    if (name.length > 1){
      bands.add(Band(id:DateTime.now().toString(),name:name,votes: 0));
      setState(() {
        
      });
    }
    Navigator.pop(context);
  }
}
