import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/design.dart';

import 'package:portfolio/utilities/api.dart';

final designProvider = FutureProvider<List<Design>>((ref) async {
  Api _api = Api();
  Response response = await _api.getData('http://127.0.0.1:8000/api/designs');
  log(response.body);
  List<Design> designs = [
    ...jsonDecode(response.body).map((e) => Design.fromMap(e)).toList()
  ];
  return designs;
});
