import 'package:flutter/material.dart';
import '../Service/dowloadProfile.dart';
import '../Model/ProfiloPagina.dart';

class GrigliaFoto extends StatefulWidget {
  @override
  _GrigliaFotoState createState() => _GrigliaFotoState();
}

class _GrigliaFotoState extends State<GrigliaFoto> {
  List<Post> y = [];

  @override
  void initState() {
    scaricaProfilo().then((valoriScaricati) {
      setState(() {
        y = valoriScaricati.posts;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new SliverGrid(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // numero di elementi per riga
          mainAxisSpacing: 3, // spazio tra elementi in riga
          crossAxisSpacing: 3, //spazio tra elementi in colonna
          childAspectRatio: 1, //lunghezza e larghezza),
        ),
        delegate: new SliverChildListDelegate(List.generate( y.length,
            /* poteva essere scritto anche in questo modo se la lista non era
             stata inizializata*/

            //y?.length ?? 0, nel caso y == null settare zero come lista
            (index) => new Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(y[index].foto),
                          fit: BoxFit.cover)),
                ))));
  }
}
