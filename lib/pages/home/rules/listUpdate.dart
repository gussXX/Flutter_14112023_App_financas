// ignore_for_file: file_names, unused_import, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;

class ListUpdate {
  Future<List<dynamic>> listUpdate() async {
    var client = http.Client();
    //
    // var url = 'localhost:9080';
    // var ip = '10.0.2.2:9080';
    //
    var myip = '192.168.18.25:9080';
    var route = 'mostrar_valores_de_um_mes';
    //
    Map<String, dynamic> body = {
      "id": "64cfc4bcdd83f5737a40f71d",
      "user": "Teste",
      "years": 2024,
      "mounth": "February"
    };

    var bodyJson = json.encode(body);
    var request = Uri.http(myip, route);
    var header = {"Content-Type": "application/json"};
    //

    late List currentMounth;

    try {
      var response = await client.post(
        request,
        body: bodyJson,
        headers: header,
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      for (var item in decodedResponse) {
        // //print(item["currentMounth"][1]);
        // print(currentMounth.length);
        // print(currentMounth);
        //
        currentMounth = item["currentMounth"];
      }
      //ESPERADO: 200
      //
      return currentMounth;
    } catch (error) {
      //ESPERADO: 200
      print('Ocorreu um erro: ${error}');
      return [];
    } finally {
      client.close();
    }
  }

  // void chartupdate_v3() async {
  //   // Cria uma instância do cliente HTTP
  //   //10.0.2.2:
  //   var client = http.Client();

  //   // Envia uma solicitação GET para a URL 'http://localhost:9080/ler_todos_valores'
  //   var response =
  //       await client.get(Uri.http('10.0.2.2:9080', 'ler_todos_valores'));

  //   // Decodifica a resposta JSON
  //   var decodedResponse = jsonDecode(response.body);

  //   // Imprime os dados da resposta
  //   print(decodedResponse);
  // }
}
