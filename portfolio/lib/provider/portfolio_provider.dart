import 'package:flutter/material.dart';
import 'package:portfolio/model/project.dart';

import '../model/design.dart';
import '../model/user.dart';

class Portfolio extends ChangeNotifier {
  late Design design;
  late Project project;
  late User user;
}
