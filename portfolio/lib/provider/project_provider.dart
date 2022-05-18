import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/project.dart';

import 'package:portfolio/utilities/api.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  Api _api = Api();
  Response response = await _api.getData('http://3.219.218.59/api/projects');
  log(response.body);
  List<Project> projects = [
    ...jsonDecode(response.body).map((e) => Project.fromMap(e)).toList()
  ];
  return projects;
});
