// ignore_for_file: prefer_adjacent_string_concatenation, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import './local_storage_provider.dart';

class ApiProvider {
  final localStorage = LocalStorage();

  Future postRequest(String uri, String ext, Map<String, dynamic> body) async {
    final _url = uri + ext;
    final resp = await http.post(
      Uri.parse(_url),
      //   HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.userToken
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'key': UriApi.key,
        HttpHeaders.authorizationHeader: "Bearer " + localStorage.userToken
      },
      body: json.encode(body),
    );
    final int statusCode = resp.statusCode;
    //  if (statusCode < 200 || statusCode > 399) {
    if (statusCode != 201) {
      final decodedData = json.decode(resp.body);
      return decodedData;
    }
    if (resp.body.isNotEmpty) {
      final decodedData = json.decode(resp.body);
      return decodedData;
    }

    return resp.statusCode;
  }

  Future getRequest(String uri, String ext) async {
    final _url = uri + ext;
    final resp = await http.get(
      Uri.parse(_url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'key': UriApi.key,
        HttpHeaders.authorizationHeader: "Bearer " + localStorage.userToken
      },
    );
    final int statusCode = resp.statusCode;
    if (statusCode < 200 || statusCode > 399) {
      return statusCode;
    }
    final decodedData = json.decode(resp.body);
    return decodedData;
  }

  Future getRequestWithParam(
      String url, String ext, Map<String, dynamic> model) async {
    final _url = url + ext;
    var headers = {
      'Authorization': 'Bearer ' + localStorage.userToken,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(_url));

    request.body = json.encode(model);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final decodedData = json.decode(await response.stream.bytesToString());
    return decodedData;
  }

  Future<int> deleteRequest(String uri, String ext) async {
    final _url = uri + ext;
    final resp = await http.delete(
      Uri.parse(_url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: localStorage.userToken
      },
    );
    return resp.statusCode;
  }

  Future putRequestCode(String url, String ext, Map? model) async {
    final _url = url + ext;
    var headers = {
      'Authorization': 'Bearer ' + localStorage.userToken,
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse(_url));

    request.body = json.encode(model);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final decodedData = json.decode(await response.stream.bytesToString());
    return decodedData;
  }

  Future putRequest(String uri, String ext, Map body) async {
    print(localStorage.userToken);
    final _url = uri + ext;
    final resp = await http.put(Uri.parse(_url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.userToken
        },
        body: json.encode(body));
    final int statusCode = resp.statusCode;
    if (statusCode < 200 || statusCode > 399) {
      return statusCode;
    }
    final decodedData = json.decode(resp.body);
    return decodedData;
  }
}
