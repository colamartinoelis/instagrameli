import 'package:flutter/material.dart';
import '../Widget/PageProfile.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:instagrameli/Model/ProfiloPagina.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   int _indice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('ELLIS'),
        centerTitle: true,
      ),
      body: new PageProfile(),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _indice = value;
          });
        },
        currentIndex: _indice,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(SimpleLineIcons.home,),
            label: 'TOP Articoli',
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Feather.search,), label: 'searc'
              'h'),
          new BottomNavigationBarItem(
              icon: new Icon(Octicons.diff_added), label: 'aggiungi'),
          new BottomNavigationBarItem(
              icon: new Icon(SimpleLineIcons.heart), label: 'heart'),
          new BottomNavigationBarItem(
              icon: new Icon(FontAwesome5.user), label: 'utente')
        ],
      ),
    );
  }
}
