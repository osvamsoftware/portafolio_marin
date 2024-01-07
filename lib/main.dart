import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/settings/theme/cubit/theme_cubit.dart';
import 'package:portfolio_marin/core/settings/theme/theme_config.dart';
import 'package:portfolio_marin/l10n/l10n.dart';
import 'package:portfolio_marin/ui/router/router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              supportedLocales: L10n.all,
              title: 'Flutter Demo',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              theme: CustomThemeData(colorSeed: Colors.transparent, isDarkMode: true, context: context).getThemeData(),
              routerConfig: GoRouterConfig.goRouter,
            );
          },
        );
      }),
    );
  }
}
