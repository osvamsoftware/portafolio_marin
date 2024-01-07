import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/constants/paths.dart';
import 'package:portfolio_marin/ui/home/views/skills/widgets/skills_row/cubit/skills_row_cubit.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SkillsView extends StatelessWidget {
  final index = 1;
  const SkillsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final imagesList = [paths.dartLogo, paths.fastApiLogo, paths.flutterLogo, paths.pythonLogo];
    final translate = AppLocalizations.of(context)!;

    return AutoScrollTag(
      key: ValueKey(index),
      controller: context.read<NavbarScrollCubit>().scrollController,
      index: index,
      child: BlocProvider(
        create: (context) => SkillsRowCubit(),
        child: Builder(builder: (context) {
          return Container(
              height: screenHeight * .85,
              color: Colors.black,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    translate.mySkills,
                    style: textStyle.displaySmall,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SkillsRowWidget(screenHeight: screenHeight, imagesList: imagesList),
                ],
              ));
        }),
      ),
    );
  }
}

class SkillsRowWidget extends StatelessWidget {
  const SkillsRowWidget({
    super.key,
    required this.screenHeight,
    required this.imagesList,
  });

  final double screenHeight;
  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    final skillsRowCubit = context.read<SkillsRowCubit>();
    return BlocBuilder<SkillsRowCubit, SkillsRowState>(
      builder: (context, state) {
        return VisibilityDetector(
          key: Key('skill-rows'),
          onVisibilityChanged: (info) {
            print(info.visibleBounds);
            if (info.visibleBounds.bottom >= 170 && state.animated == false) {
              print(info.visibleFraction);
              skillsRowCubit.startAnimation();
            }
            if (info.visibleBounds.bottom == 0 && state.animated == true) {
              print(info.visibleFraction);
              skillsRowCubit.stopAnimation();
            }
          },
          child: Container(
            height: screenHeight * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.blue.withOpacity(.3), Colors.transparent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  imagesList.length,
                  (index) => SizedBox(
                    height: screenHeight * .15,
                    width: screenHeight * .2,
                    child: Center(
                      child: FadeIn(
                        duration: Duration(seconds: 1),
                        // manualTrigger: true,
                        animate: state.animated,
                        controller: (controller) => skillsRowCubit.initAnimatedController(controller, index),
                        child: Image.asset(imagesList[index]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
