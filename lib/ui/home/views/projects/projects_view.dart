import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/constants/paths.dart';
import 'package:portfolio_marin/data/models/project_item_model.dart';
import 'package:portfolio_marin/ui/shared/custom_widgets/custom_web_appbar/cubit/navbar_scroll_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectsView extends StatelessWidget {
  final index = 3;
  ProjectsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProjectItem> projectsList = [
      ProjectItem(
          title: '', label: '', subtitle: 'Santiago Clothes', imageList: [paths.store1, paths.store2, paths.store3]),
      ProjectItem(title: '', label: '', subtitle: 'Vigo Drive', imageList: [paths.vigo1, paths.vigo2, paths.vigo3]),
      ProjectItem(title: '', label: '', subtitle: 'Event Land', imageList: [paths.calendar1, paths.calendar2]),
      ProjectItem(title: '', label: '', subtitle: 'ProyectaApp', imageList: [paths.viajes1, paths.viajes2])
    ];
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final translate = AppLocalizations.of(context)!;

    final List descriptionList = [
      translate.eCommerceDescription,
      translate.taxiDescription,
      translate.eventDescription,
      translate.travelDescription
    ];

    for (int i = 0; i < projectsList.length; i++) {
      projectsList[i] =
          projectsList[i].copyWith(body: descriptionList[i], title: translate.projects, label: translate.whatIDo);
    }

    return AutoScrollTag(
      key: ValueKey(index),
      controller: context.read<NavbarScrollCubit>().scrollController,
      index: index,
      child: Container(
        height: MediaQuery.of(context).size.height * .85,
        color: Colors.black,
        alignment: Alignment.center,
        child: SizedBox(
          height: screenHeight * .6,
          width: screenWidth,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return CustomBannerRow(
                color: theme.primaryColor,
                body: projectsList[index].body ?? '',
                imagesList: projectsList[index].imageList,
                label: projectsList[index].label,
                subtitle: projectsList[index].subtitle,
                title: projectsList[index].title,
              );
            },
            itemCount: projectsList.length,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),
        ),
      ),
    );
  }
}

class CustomBannerRow extends StatelessWidget {
  const CustomBannerRow(
      {super.key,
      required this.color,
      required this.title,
      required this.label,
      required this.subtitle,
      required this.body,
      required this.imagesList});
  final Color color;
  final String title;
  final String label;
  final String subtitle;
  final String body;
  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    return Container(
      height: screenHeight * .6,
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, color],
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: screenWidth * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: textStyle.displayMedium!.copyWith(color: color),
                ),
                Container(
                  height: 3,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  color: color,
                ),
                Text(label, style: textStyle.titleMedium!),
                Text(subtitle, style: textStyle.displaySmall!),
                Text(body, style: textStyle.titleMedium!, maxLines: 4, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(
            // color: Colors.red,
            height: screenHeight * .6,
            width: screenHeight * .6,
            child: Stack(
              children: [
                if (imagesList.length > 2)
                  Positioned(
                    bottom: -65,
                    right: 200,
                    child: SizedBox(
                      height: screenHeight * .45,
                      // color: Colors.blue,
                      child: Image.asset(imagesList[2]),
                    ),
                  ),
                if (imagesList.length > 1)
                  Positioned(
                    bottom: -65,
                    right: 0,
                    child: SizedBox(
                      height: screenHeight * .55,
                      // color: Colors.blue,
                      child: Image.asset(imagesList[1]),
                    ),
                  ),
                Positioned(
                  bottom: -65,
                  right: 100,
                  child: SizedBox(
                    height: screenHeight * .6,
                    // color: Colors.blue,
                    child: Image.asset(imagesList[0]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
