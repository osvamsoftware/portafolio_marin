import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/constants/paths.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutMeView extends StatelessWidget {
  final index = 0;
  const AboutMeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    final translate = AppLocalizations.of(context)!;

    return AutoScrollTag(
      key: ValueKey(index),
      controller: context.read<NavbarScrollCubit>().scrollController,
      index: index,
      child: Container(
          height: screenHeight * .85,
          color: Colors.black,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenWidth * .3,
                width: screenWidth * .25,
                margin: EdgeInsets.all(30),
                child: ZoomIn(
                  from: .9,
                  child: Image.asset(
                    paths.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    child: Text(translate.aboutMe,
                        style: textStyle.bodyMedium!.copyWith(color: theme.primaryColor, fontWeight: FontWeight.w900)),
                  ),
                  FadeInRight(
                      child: Text(translate.helloIm,
                          style: textStyle.headlineMedium!.copyWith(fontWeight: FontWeight.w900))),
                  FadeInRight(
                    child: Text('Marín',
                        style:
                            textStyle.headlineMedium!.copyWith(color: theme.primaryColor, fontWeight: FontWeight.w900)),
                  ),
                  FadeInDownBig(
                    child: Container(
                      height: 3,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      color: theme.primaryColor,
                    ),
                  ),
                  ShakeX(
                    child: SizedBox(
                      width: 200,
                      child: Text(translate.myDescription,
                          style: textStyle.bodySmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w200)),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

//0b5bb6
