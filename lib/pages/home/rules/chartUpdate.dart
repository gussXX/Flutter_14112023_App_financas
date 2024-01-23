// ignore_for_file: file_names, unused_import, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChartUpdate {
  Future<Map<String, double>> chartUpdate() async {
    // void chartUpdate() async {
    var client = http.Client();
    var myip = '192.168.18.25:9080';
    var route = 'somar_entrada_e_saida';
    //
    var request = Uri.http(myip, route);
    var header = {"Content-Type": "application/json"};
    Map<String, double> myMap = {};

    try {
      List val = ['entrada', 'saida'];
      //
      for (var element in val) {
        var response = await client.post(
          request,
          body: json.encode({
            "id": "64cfc4bcdd83f5737a40f71d",
            "user": "Teste",
            "years": 2024,
            "mounths": "February",
            "tipe": element.toString()
          }),
          headers: header,
        );

        var decodedResponse =
            jsonDecode(utf8.decode(response.bodyBytes)) as List;

        for (var item in decodedResponse) {
          myMap.putIfAbsent(element, () => item["total"]);
          print('${element}: ${item["total"]}');
        }
      }

      print('-=========');
      print(myMap);

      return myMap;
    } catch (error) {
      print('Ocorreu um erro: ${error}');
      return myMap;
    } finally {
      client.close();
    }
  }
}
