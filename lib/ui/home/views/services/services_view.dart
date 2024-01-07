import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/constants/paths.dart';
import 'package:portfolio_marin/data/models/web_service_item_model.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesView extends StatelessWidget {
  final index = 2;
  const ServicesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final translate = AppLocalizations.of(context)!;

    final List<WebServiceItem> serviceList = [
      WebServiceItem(name: 'Mobile Apps', imagePath: paths.mobileAppImage),
      WebServiceItem(name: 'Web Site', imagePath: paths.webAppImage),
      WebServiceItem(name: 'E-Commerce', imagePath: paths.shopImage),
      WebServiceItem(name: 'Dashboard', imagePath: paths.dashboardImage)
    ];

    return AutoScrollTag(
      key: ValueKey(index),
      controller: context.read<NavbarScrollCubit>().scrollController,
      index: index,
      child: Container(
        height: screenHeight * .84,
        color: Color.fromARGB(255, 1, 0, 7),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translate.services,
                style: textStyle.displayMedium!.copyWith(color: theme.primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    serviceList.length,
                    (index) => CustomZoomImage(
                      textStyle: textStyle,
                      label: serviceList[index].name,
                      imagePath: serviceList[index].imagePath,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomZoomImage extends StatefulWidget {
  const CustomZoomImage({
    super.key,
    required this.textStyle,
    this.height = 100,
    this.width = 100,
    required this.label,
    required this.imagePath,
  });
  final TextTheme textStyle;
  final double height, width;
  final String label;
  final String imagePath;
  @override
  State<CustomZoomImage> createState() => _CustomZoomImageState();
}

class _CustomZoomImageState extends State<CustomZoomImage> {
  late double currentHeight;
  late double currentWidth;

  @override
  void initState() {
    currentHeight = widget.height;
    currentWidth = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (value) {
            _zoomIn();
          },
          onExit: (event) {
            _zoomOut();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: currentHeight,
                width: currentWidth,
                color: Colors.amber,
                child: Image.asset(widget.imagePath)),
          ),
        ),
        Text(
          widget.label,
          style: widget.textStyle.headlineSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  void _zoomIn() {
    currentHeight = currentHeight + (currentHeight * .1);
    currentWidth = currentWidth + (currentWidth * .1);
    setState(() {});
  }

  void _zoomOut() {
    currentHeight = widget.height;
    currentWidth = widget.width;
    setState(() {});
  }
}

//0b5bb6
