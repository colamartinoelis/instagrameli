import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:instagrameli/Model/ProfiloPagina.dart';

Future<PaginaProfilo> scaricaProfilo() async {
  final response = await http.get("https://api.npoint.io/f4c5794a1a0418045548");
 /* if (response.statusCode != 200) {
    throw Exception("ERROR during download");
  }
*/
  final data = json.decode(response.body);

  return PaginaProfilo.fromData(data);
}
