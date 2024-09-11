import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//import '../../utils/constants/png_assets.dart';

class BottomBarItem {
  final String name;
  final String icon;
  final String filledIcon;
  final int index;

  BottomBarItem({
    required this.name,
    required this.icon,
    required this.filledIcon,
    required this.index,
  });

  static List<BottomBarItem> clientItems(context) => [
        BottomBarItem(
          filledIcon: SvgAssets.homeFilledIcon,
          icon: SvgAssets.homeOutlinedIcon,
          name: AppLocalizations.of(context)!.home,
          index: 0,
        ),
        BottomBarItem(
          filledIcon: SvgAssets.exploreFilledIcon,
          icon: SvgAssets.exploreOutlinedIcon,
          name: AppLocalizations.of(context)!.explore,
          index: 1,
        ),
        BottomBarItem(
          filledIcon: SvgAssets.expertFilledIcon,
          icon: SvgAssets.expertOutlinedIcon,
          name: AppLocalizations.of(context)!.experts,
          index: 2,
        ),
        BottomBarItem(
          filledIcon: SvgAssets.forumFilledIcon,
          icon: SvgAssets.forumOutlinedIcon,
          name: AppLocalizations.of(context)!.forum,
          index: 3,
        ),
        /*
        BottomBarItem(
          filledIcon: PngAssets.chartFilledIcon,
          icon: PngAssets.chartOutlinedIcon,
          name: AppLocalizations.of(context)!.insights,
          index: 4,
        ),*/
        BottomBarItem(
          filledIcon: SvgAssets.userFilledIcon,
          icon: SvgAssets.userOutlinedIcon,
          name: AppLocalizations.of(context)!.account,
          index: 4, //index:5,
        ),
      ];
}
