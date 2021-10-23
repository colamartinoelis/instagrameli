import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class PaginaProfilo {
  final Utente user;
  final List<Post> posts;

  const PaginaProfilo({@required this.user, @required this.posts});

  factory PaginaProfilo.fromData(dynamic data) {
    //il punto nodale è nella riga 13!!! in Utente.fromData acquisisco un
    // insieme più grande e mi metto già in user
    final Utente user = Utente.fromData(data["graphql"]["user"]);
    final List<dynamic> dynamicPost =
        data["graphql"]["user"]["edge_owner_to_timeline_media"
            ""]["edges"];

// ho una lista dinamica ora devo mapparrla e convertila in una lista

    final List<Post> post =
        dynamicPost.map((elemento) => Post.fromData(elemento["node"])).toList();

    return PaginaProfilo(
      user: user,
      posts: post,
    );
  }
}

class Utente {
  final String username;
  final String avatar;
  final String biografia;
  final String fullname;

  const Utente({
    @required this.username,
    @required this.avatar,
    @required this.biografia,
    @required this.fullname,
  });

  factory Utente.fromData(dynamic data) {
    final fullname = data["full_name"];
    final username = data["username"];
    final avatar = data["https://picsum.photos/id/1003/200/200"];
    final biografia = data["biography"];

    return Utente(
      username: username,
      avatar: avatar,
      biografia: biografia,
      fullname: fullname,
    );
  }
}

class Post {
  final String foto;
  const Post({@required this.foto});
  factory Post.fromData(dynamic data) {
    final foto = data["display_url"];
    return Post(
      foto: foto,
    );
  }
}
