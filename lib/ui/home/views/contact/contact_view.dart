import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_marin/core/constants/paths.dart';
import 'package:portfolio_marin/ui/home/views/contact/cubit/contact_cubit.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContactView extends StatelessWidget {
  final index = 4;

  const ContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    final translate = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => ContactCubit(),
      child: Builder(builder: (context) {
        return BlocConsumer<ContactCubit, ContactState>(
          listenWhen: (previous, current) => previous.messageState != current.messageState,
          listener: (context, contactState) {
            if (contactState.messageState == MessageState.sending) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SizedBox(
                    height: screenHeight * .4,
                    width: screenWidth * .3,
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator.adaptive(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(translate.sending)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            if (contactState.messageState == MessageState.sended) {
              context.pop();
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SizedBox(
                    height: screenHeight * .4,
                    width: screenWidth * .3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(translate.sended),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            translate.thanksFor,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(onPressed: () => context.pop(), child: Text('Ok'))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            if (contactState.messageState == MessageState.error) {
              context.pop();
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SizedBox(
                    height: screenHeight * .4,
                    width: screenWidth * .3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(translate.error),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            translate.tryAgain,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(onPressed: () => context.pop(), child: Text('Ok'))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, contactState) {
            final contactCubit = context.read<ContactCubit>();
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VisibilityDetector(
                        key: Key('skill-rows'),
                        onVisibilityChanged: (info) {
                          print(info.visibleBounds);
                          if (info.visibleBounds.bottom >= 170 && contactState.animated == false) {
                            print(info.visibleFraction);
                            contactCubit.startAnimation();
                          }
                          if (info.visibleBounds.bottom == 0 && contactState.animated == true) {
                            print(info.visibleFraction);
                            contactCubit.stopAnimation();
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInRight(
                                animate: contactState.animated,
                                child: Text(translate.contact,
                                    style: textStyle.headlineMedium!
                                        .copyWith(fontWeight: FontWeight.w900, color: theme.primaryColor))),
                            FadeInDownBig(
                              animate: contactState.animated,
                              child: Container(
                                height: 3,
                                width: 50,
                                margin: EdgeInsets.symmetric(vertical: 20),
                                color: theme.primaryColor,
                              ),
                            ),
                            ShakeX(
                              animate: contactState.animated,
                              child: SizedBox(
                                width: 200,
                                child: Text(translate.areYouReady,
                                    style: textStyle.bodySmall!
                                        .copyWith(color: Colors.white, fontWeight: FontWeight.w200)),
                              ),
                            ),
                            FadeInRight(
                              child: SizedBox(
                                width: 100,
                                child: Image.asset(
                                  paths.messageIcon,
                                ),
                              ),
                              animate: contactState.animated,
                              duration: Duration(seconds: 2),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        width: screenWidth * .35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(label: Text(translate.name)),
                            ),
                            TextFormField(
                              decoration: InputDecoration(label: Text(translate.email)),
                            ),
                            TextFormField(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(label: Text(translate.message)),
                            ),
                            SizedBox(
                              height: screenHeight * .1,
                            ),
                            ElevatedButton(onPressed: () => contactCubit.sendMessage(), child: Text(translate.send))
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      }),
    );
  }
}
