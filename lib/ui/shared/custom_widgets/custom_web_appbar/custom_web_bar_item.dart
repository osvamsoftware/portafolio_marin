import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/constants/paths.dart';
import 'package:portfolio_marin/data/models/web_bar_item_model.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomWebNavigationBar extends StatelessWidget {
  final Function()? onTap;
  const CustomWebNavigationBar({
    super.key,
    this.onTap,
  });

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

    return BlocBuilder<NavbarScrollCubit, NavbarScrollState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: screenHeight * .13,
              width: screenHeight * .13,
              child: Image.asset(paths.logoFace),
            ),
            Text(
              'Marín Dev',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w100),
            ),
            const Spacer(),
            ...List.generate(
                navbarItems.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomWebBarItem(
                        label: navbarItems[index].label,
                        onTap: () => scrollToIndex(index, context.read<NavbarScrollCubit>().scrollController),
                        color: Colors.white,
                        hoverColor: Colors.indigo,
                      ),
                    )),
            const SizedBox(
              width: 40,
            )
          ],
        );
      },
    );
  }
}

scrollToIndex(int index, AutoScrollController scrollController) {
  scrollController.scrollToIndex(
    index,
    preferPosition: AutoScrollPosition.middle,
    duration: const Duration(seconds: 1),
  );
}

class CustomWebBarItem extends StatefulWidget {
  final Color color, selectedColor;
  final Color? hoverColor;
  final bool isSelected;
  final Function()? onTap;
  final String label;

  const CustomWebBarItem({
    super.key,
    required this.color,
    this.selectedColor = Colors.black,
    this.hoverColor,
    this.isSelected = false,
    this.onTap,
    this.label = 'label',
  });

  @override
  State<CustomWebBarItem> createState() => _CustomWebBarItemState();
}

class _CustomWebBarItemState extends State<CustomWebBarItem> {
  late Color currentColor;

  @override
  void initState() {
    setState(() {
      currentColor = widget.color;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap ?? () {},
        onHover: (value) {
          setState(() {
            print(value);
            _changeColor(value);
          });
        },
        mouseCursor: MouseCursor.defer,
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: widget.isSelected ? widget.selectedColor : currentColor,
              ),
        ));
  }

  void _changeColor(bool value) {
    currentColor = value
        ? widget.hoverColor ?? Colors.grey
        : widget.isSelected
            ? widget.selectedColor
            : widget.color;
  }
}
