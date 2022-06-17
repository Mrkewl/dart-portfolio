import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/user.dart';
import 'package:portfolio/utilities/api.dart';

final userProvider = FutureProvider<User>((ref) async {
  Api _api = Api();
  Response response = await _api.getData('http://127.0.0.1:8000/api/user');
  log(response.body);
  User user = User.fromMap(jsonDecode(response.body)[0]);
  return user;
});
