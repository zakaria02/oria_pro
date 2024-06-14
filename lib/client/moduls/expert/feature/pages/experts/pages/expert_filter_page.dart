import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/cubit/expert_filter_cubit.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/city.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_drop_down.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_search_drop_down.dart';

import '../../../../../../../utils/constants/oria_colors.dart';
import '../../../entity/province.dart';
import '../widgets/rating_widget.dart';

@RoutePage()
class ExpertFilterPage extends StatefulWidget {
  const ExpertFilterPage({
    super.key,
    required this.specilalties,
    required this.cities,
    required this.selectedSpeciality,
    required this.selectedCity,
    required this.selectedRating,
    required this.provinces,
    required this.selectedProvince,
  });

  final List<Specialty> specilalties;
  final List<City> cities;
  final List<Province> provinces;
  final Specialty? selectedSpeciality;
  final int? selectedRating;
  final City? selectedCity;
  final Province? selectedProvince;

  @override
  State<ExpertFilterPage> createState() => _ExpertFilterPageState();
}

class _ExpertFilterPageState extends State<ExpertFilterPage> {
  final TextEditingController cityController = TextEditingController();
  Specialty? selectedSpeciality;
  late City? selectedCity;
  late Province? selectedProvince;
  late List<City> provinceCities;
  int? selectedRating;
  Rating? rating;

  @override
  void initState() {
    selectedSpeciality = widget.selectedSpeciality;
    rating = switch (widget.selectedRating) {
      4 => Rating.rating4,
      3 => Rating.rating3,
      2 => Rating.rating2,
      _ => Rating.all,
    };
    selectedRating = widget.selectedRating;
    selectedProvince = widget.selectedProvince;
    provinceCities = widget.cities
        .where((city) => city.provinceId == selectedProvince?.id)
        .toList();
    selectedCity = widget.selectedCity;
    if (selectedCity != null) {
      selectedProvince = widget.provinces
          .firstWhere((province) => province.id == selectedCity!.provinceId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OriaScaffold(
      appBarData: AppBarData(
        firstButtonUrl: SvgAssets.backAsset,
        onFirstButtonPress: () => context.maybePop(),
        title: AppLocalizations.of(context)!.filters,
      ),
      body: BlocBuilder<ExpertFilterCubit, ExpertFilterState>(
        builder: (context, state) {
          return Expanded(
            child: ListView(
              children: [
                OriaCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.specialty,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      OriaDropDown<Specialty>(
                        selectedItem: selectedSpeciality,
                        items: widget.specilalties,
                        onValueChange: (specialty) {
                          setState(() {
                            selectedSpeciality = specialty;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppLocalizations.of(context)!.province,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      OriaDropDown<Province>(
                        selectedItem: selectedProvince,
                        items: widget.provinces,
                        onValueChange: (province) {
                          setState(() {
                            if (selectedProvince != province) {
                              selectedProvince = province;
                              provinceCities = widget.cities
                                  .where((city) =>
                                      city.provinceId == selectedProvince?.id)
                                  .toList();
                              selectedCity = null;
                              cityController.text = "";
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      OriaSearchDropDown<City>(
                        controller: cityController,
                        selectedItem: selectedCity,
                        items: provinceCities,
                        onSelected: (city) {
                          selectedCity = city;
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppLocalizations.of(context)!.customerReview,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      RatingWidget(
                        onPress: (rat) {
                          setState(() {
                            rating = rat;
                          });
                          selectedRating = null;
                        },
                        rating: rating,
                      ),
                      RatingWidget(
                        count: 4,
                        onPress: (rat) {
                          setState(() {
                            rating = rat;
                          });
                          selectedRating = 4;
                        },
                        rating: rating,
                      ),
                      RatingWidget(
                        count: 3,
                        onPress: (rat) {
                          setState(() {
                            rating = rat;
                          });
                          selectedRating = 3;
                        },
                        rating: rating,
                      ),
                      RatingWidget(
                        count: 2,
                        onPress: (rat) {
                          setState(() {
                            rating = rat;
                          });
                          selectedRating = 2;
                        },
                        rating: rating,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: OriaRoundedButton(
              padding: EdgeInsets.zero,
              onPress: () {
                BlocProvider.of<ExpertFilterCubit>(context).resetFilters();
                context.maybePop();
              },
              text: AppLocalizations.of(context)!.reset,
              textColor: OriaColors.green,
              borderColor: OriaColors.green,
              primaryColor: OriaColors.scaffoldBackgroundColor,
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: OriaRoundedButton(
              padding: EdgeInsets.zero,
              onPress: () {
                BlocProvider.of<ExpertFilterCubit>(context).addFilter(
                  specialty: selectedSpeciality,
                  city: selectedCity,
                  rating: selectedRating,
                );
                context.maybePop();
              },
              text: AppLocalizations.of(context)!.apply,
              primaryColor: OriaColors.darkOrange,
            ),
          ),
        ],
      ),
    );
  }
}
