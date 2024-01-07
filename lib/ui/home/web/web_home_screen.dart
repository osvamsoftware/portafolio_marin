import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/data/models/web_bar_item_model.dart';
import 'package:portfolio_marin/ui/home/views/about_me/about_me_view.dart';
import 'package:portfolio_marin/ui/home/views/contact/contact_view.dart';
import 'package:portfolio_marin/ui/home/views/projects/projects_view.dart';
import 'package:portfolio_marin/ui/home/views/services/services_view.dart';
import 'package:portfolio_marin/ui/home/views/skills/skills_view.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/custom_web_bar_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebHomeScreen extends StatelessWidget {
  static const path = '/web-home-screen';
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final translate = AppLocalizations.of(context)!;

    final List<WebBarItemModel> navbarItems = [
      WebBarItemModel(label: translate.aboutMe, keyPath: 'w1'),
      WebBarItemModel(label: translate.mySkills, keyPath: 'w2'),
      WebBarItemModel(label: translate.services, keyPath: 'w3'),
      WebBarItemModel(label: translate.projects, keyPath: 'w4'),
      WebBarItemModel(label: 'contact', keyPath: 'w5'),
    ];
    return BlocProvider(
      create: (context) => NavbarScrollCubit()..initNavBar(navbarItems),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: screenHeight * .15,
            title: const CustomWebNavigationBar(),
          ),
          body: BlocBuilder<NavbarScrollCubit, NavbarScrollState>(
            builder: (context, state) {
              return ListView(
                controller: context.read<NavbarScrollCubit>().scrollController,
                children: [AboutMeView(), SkillsView(), ServicesView(), ProjectsView(), ContactView()],
              );
            },
          ),
        );
      }),
    );
  }
}
