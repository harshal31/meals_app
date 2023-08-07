import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<int> {
  TabNotifier(super.state);

  void updateTabIndex(int index) {
    state = index;
  }
}

final tabProvider =
    StateNotifierProvider<TabNotifier, int>((ref) => TabNotifier(0));
