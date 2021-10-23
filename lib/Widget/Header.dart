import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Service/dowloadProfile.dart';
import 'package:instagrameli/Model/ProfiloPagina.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Utente x;

  @override
  void initState() {
    scaricaProfilo().then((valoriScaricati) {
      setState(() {
        x = valoriScaricati.user;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => x == null
      ? SliverToBoxAdapter(child: new Container())
      : new SliverToBoxAdapter(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              primaRiga(x),
              secondaRiga(x),
              terzaRiga(),
              quartaRiga(context),
              new Divider(
                color: Colors.grey,
              ),
              quintaRiga(),
              new Divider(
                color: Colors.grey,
              ),
            ]));
}

/* ---------Widget della pagina---------------------*/

Widget primaRiga(Utente utente) {
  return new Padding(
      padding: EdgeInsets.all(16),
      child: new Row(children: <Widget>[
        new CircleAvatar(
          /*    backgroundImage: new NetworkImage(utente.avatar),*/
          backgroundImage: new AssetImage("Immagini/koala.jpeg"),
          //perchè non ho potuto mettere Immage.asset("")?? forse
          // perchè in questo caso viene chiesto una classe di
          // ImmageProvider?
          radius: 40,
          backgroundColor: Colors.red,
        ),
        new SizedBox(
          width: 16,
        ),
        new Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            new Text(
              utente.username,
              style: new TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            new SizedBox(
              height: 6,
            ),
            new MaterialButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5)),
              height: 40,
              minWidth: double.infinity,
              onPressed: () {},
              child: new Text(
                'Segui',
                style: new TextStyle(color: Colors.white, fontSize: 13),
              ),
              color: Colors.blue,
            )
          ]),
        ),
      ]));
}

Widget secondaRiga(Utente utente) {
  return new ListTile(
      title: new Text(
        utente.fullname,
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              utente.biografia,
            ),
            new SizedBox(
              height: 6,
            ),
            new InkWell(
                onTap: () =>
                    launch('https://github.com/colamartinoelis/meteoelisapi'
                        '.php'),
                child: new Text('www.github/meteoelisapi')),
          ]));
}

Widget terzaRiga() {
  return new Padding(
      padding: EdgeInsets.only(left: 16),
      child: new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        new Text(
          'Follower:',
          style: new TextStyle(color: Colors.grey),
        ),
        new TextButton(
            onPressed: () {},
            child: new Text(' e cillum iatur. Excaecat cupidpid',
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black))),
      ]));
}

Widget quartaRiga(BuildContext context) => new Padding(
    padding: new EdgeInsets.all(16),
    child: new Row(
      children: [
        new Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: double.infinity,
                child: new ListView.builder(
                  padding: EdgeInsets.only(right: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return new Padding(
                        padding: EdgeInsets.only(right: 5),
                        child:
                            new Stack(alignment: Alignment.center, children: [
                          new Container(
                              height: 70,
                              width: 70,
                              decoration: new BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[400],
                                  ),
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(70)))),
                          new Container(
                              height: 60,
                              width: 60,
                              decoration: new BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey[400],
                                      style: BorderStyle.solid),
                                  borderRadius:
                                      new BorderRadius.all(Radius.circular(60)),
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(
                                        "https://picsum"
                                        ".photos/id/1003/200/200",
                                      )))),
                        ]));
                    /*new CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.blue,
                            child: new CircleAvatar(
                                radius: 30,
                                backgroundImage: new NetworkImage(
                                  "https://picsum"
                                  ".photos/id/1003/200/200",
                                ) //
                                // .photos/id/1003/200/200
                                )));*/
                  },
                )))
      ],
    ));

Widget quintaRiga() {
  final List<String> etichetta = ["post", "follower", "profili seguiti"];
  final List<String> valori = ["50", "100", "10"];

  return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          3,
          (index) => new Column(children: [
                new Text(valori[index],
                    style: new TextStyle(fontWeight: FontWeight.bold)),
                new Text(
                  etichetta[index],
                  style: new TextStyle(color: Colors.grey),
                )
              ])));
} /*
         [ new Column(
          children: [
            new Text("10", style: new TextStyle(fontWeight: FontWeight.bold)),
            new Text(
              "post",
              style: new TextStyle(color: Colors.grey),
            ),
          ],
        ),
        new Column(
          children: [
            new Text("1", style: new TextStyle(fontWeight: FontWeight.bold)),
            new Text(
              "follower",
              style: new TextStyle(color: Colors.grey),
            ),
          ],
        ),
        new Column(
          children: [
            new Text("10", style: new TextStyle(fontWeight: FontWeight.bold)),
            new Text(
              "profili seguiti",
              style: new TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],*/

/* ---------Widget della pagina ---------------------*/
