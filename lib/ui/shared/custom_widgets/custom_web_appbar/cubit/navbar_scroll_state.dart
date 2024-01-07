// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navbar_scroll_cubit.dart';

class NavbarScrollState extends Equatable {
  final List<WebBarItemModel> navbarItems;
  final Map<String, ValueKey> globalKeys;

  NavbarScrollState({required this.navbarItems, required this.globalKeys});

  NavbarScrollState copyWith({
    List<WebBarItemModel>? navbarItems,
    Map<String, ValueKey>? globalKeys,
  }) {
    return NavbarScrollState(
      navbarItems: navbarItems ?? this.navbarItems,
      globalKeys: globalKeys ?? this.globalKeys,
    );
  }

  @override
  List<Object?> get props => [navbarItems, globalKeys];
}
