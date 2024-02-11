// ignore_for_file: file_names, unused_import, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;

class ListUpdatev2 {
  Future listUpdate({
    required String id,
    required String user,
    required Map filter,
  }) async {
    //
    var client = http.Client();
    var note = '192.168.18.25:9080';
    var desk = '192.168.11.101:9080';
    var online = '10.0.2.2:9080';
    var route = 'filtrar_list';
    //
    var request = Uri.http(note, route);
    var header = {"Content-Type": "application/json"};

    print(filter);

    try {
      //
      var response = await client.post(
        request,
        body: json.encode({
          "id": id,
          "user": user,
          //
          "startDate": filter['start'],
          "finalDate": filter['final']
        }),
        headers: header,
      );
      return jsonDecode(response.body);
      //
    } catch (error) {
      print('Ocorreu um erro: ${error}');
      return [];
    } finally {
      client.close();
    }
  }
}
