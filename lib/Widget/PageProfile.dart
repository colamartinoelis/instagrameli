import 'package:flutter/material.dart';
import 'package:instagrameli/Widget/GrigliaFoto.dart';
import 'package:instagrameli/Widget/Header.dart';

class PageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        Header(),
        GrigliaFoto(),
      ],
    );
  }
}
