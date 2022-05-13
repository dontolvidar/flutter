import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {                    //statefulWidget para hacer pruebas locales sobre el contenedor
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 1),
    Band(id: '3', name: 'Heroes del silencio', votes: 2),
    Band(id: '4', name: 'Bon Jovi', votes: 3)
  ];    //lista de bandas
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       //barra arriba
        title: Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),

      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, i) => _bandTile(bands[i])
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand,
      ),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(band.name.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      title: Text(band.name),
      trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
      onTap: () {
        print(band.name);
      },
    );
  }

  addNewBand(){
    final TextEditingController textController = new TextEditingController();
    showDialog(
      context: context, 
      builder: (context)
      {
        return AlertDialog(
          title: Text("New band name:"),
          content: TextField(),
          actions: <Widget>[
            MaterialButton(
              child: Text('Add'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: (){})
          ],
        );
      }
      );
  }

}
