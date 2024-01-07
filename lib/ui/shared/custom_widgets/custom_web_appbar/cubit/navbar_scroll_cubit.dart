import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/data/models/web_bar_item_model.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'navbar_scroll_state.dart';

class NavbarScrollCubit extends Cubit<NavbarScrollState> {
  final scrollController = AutoScrollController();
  final scrollDuration = Duration(seconds: 2);

  NavbarScrollCubit() : super(NavbarScrollState(globalKeys: {}, navbarItems: []));

  initNavBar(List<WebBarItemModel> navbarItems) {
    Map<String, ValueKey<int>> keys = {};

    for (int i = 0; i < navbarItems.length; i++) {
      keys[navbarItems[i].keyPath] = ValueKey(i);
    }
    emit(state.copyWith(globalKeys: keys));
  }
}
