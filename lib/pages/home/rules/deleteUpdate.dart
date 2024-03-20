// ignore_for_file: file_names, unused_import, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteUpdate {
  Future <bool> deleteUpdate({
    required Map deleteQuery,
  }) async {
    //
    var client = http.Client();
    var note = '192.168.18.25:9080';
    var desk = '192.168.11.101:9080';
    var online = '10.0.2.2:9080';
    var route = 'deletar';
    //
    var request = Uri.http(desk, route);
    var header = {"Content-Type": "application/json"};

    try {
      //
      var response = await client.post(
        request,
        body: json.encode(deleteQuery),
        headers: header,
      );
      //
      return true;
    } catch (error) {
      print('Ocorreu um erro: ${error}');
      return false;
    } finally {
      client.close();
    }
  }
}
