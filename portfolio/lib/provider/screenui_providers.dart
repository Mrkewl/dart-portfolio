import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenUiProvider = StateNotifierProvider<ProjectCounter, int>((ref) {
  return ProjectCounter();
});

class ProjectCounter extends StateNotifier<int> {
  ProjectCounter() : super(0);
  void changeValue(int changePage) {
    state = changePage;
  }
}

final bottomNavigationUiProvider =
    StateNotifierProvider<BottomNavigationCounter, int>((ref) {
  return BottomNavigationCounter();
});

class BottomNavigationCounter extends StateNotifier<int> {
  BottomNavigationCounter() : super(0);
  void changeValue(int changePage) {
    state = changePage;
  }
}
