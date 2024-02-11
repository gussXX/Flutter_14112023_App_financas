// ignore_for_file: file_names, unused_import, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChartUpdatev2 {
  Future<Map> chartUpdate() async {
    //
    var client = http.Client();
    var note = '192.168.18.25:9080';
    var desk = '192.168.11.101:9080';
    var online = '10.0.2.2:9080';
    var route = 'filtrar_data';
    //
    var request = Uri.http(note, route);
    var header = {"Content-Type": "application/json"};
    Map<String, double> myMap = {};

    try {
      //
      var response = await client.post(
        request,
        body: json.encode({
          "id": "64cfc4bcdd83f5737a40f71d",
          "user": "Teste",
          "years": 2024,
        }),
        headers: header,
      );

      // var mapencode = (response.body);
      // Map<String, dynamic> mapDynamic = json.decode(mapencode);
      // Map<String, dynamic> mapDouble = Map<String, double>.from(mapDynamic
      //     .map((key, value) => MapEntry<String, dynamic>(key, value)));

      return jsonDecode(response.body);
      //
    } catch (error) {
      print('Ocorreu um erro: ${error}');
      return {'entrada': 0.0, 'saida': 0.0};
    } finally {
      client.close();
    }
  }
}
