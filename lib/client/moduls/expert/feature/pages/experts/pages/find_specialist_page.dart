import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:oria_pro/client/moduls/expert/feature/bloc/expert_bloc.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';
import 'package:oria_pro/client/moduls/expert/feature/pages/experts/widgets/filter_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_icon_button.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../cubit/expert_filter_cubit.dart';
import '../../../entity/city.dart';
import '../../../entity/expert.dart';
import '../widgets/expert_detailed_card.dart';
import 'expert_filter_page.dart';

@RoutePage()
class FindSpecialistPage extends StatefulWidget {
  const FindSpecialistPage({super.key, required this.specialty});

  final Specialty specialty;

  @override
  State<FindSpecialistPage> createState() => _FindSpecialistPageState();
}

class _FindSpecialistPageState extends State<FindSpecialistPage> {
  final TextEditingController _controller = TextEditingController();

  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  List<Expert> experts = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpertFilterCubit()
        ..addFilter(
          specialty: widget.specialty,
        )
        ..getCities(),
      child: BlocConsumer<ExpertFilterCubit, ExpertFilterState>(
        listener: (filterContext, filterState) {
          BlocProvider.of<ExpertBloc>(filterContext).add(
            FetchSpecialtyExperts(
              specialty: filterState.specialty,
              city: filterState.city,
              rating: filterState.rating,
              page: 1,
            ),
          );
        },
        builder: (filterContext, filterState) {
          return BlocBuilder<ExpertBloc, ExpertState>(
            builder: (expertContext, expertState) {
              experts = _controller.text.isEmpty
                  ? expertState.specialtyExperts
                  : expertState.specialtyExperts
                      .where((expert) =>
                          _controller.text
                              .toLowerCase()
                              .contains(expert.firstName.toLowerCase()) ||
                          _controller.text
                              .toLowerCase()
                              .contains(expert.lastName.toLowerCase()))
                      .toList();

              return OriaScaffold(
                appBarData: AppBarData(
                  firstButtonUrl: SvgAssets.backAsset,
                  onFirstButtonPress: () => context.maybePop(),
                  title: AppLocalizations.of(context)!.findSpecialist,
                ),
                body: Expanded(
                  child: Column(
                    children: [
                      Visibility(
                        visible: expertState is SpecialityExpertLoading,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: OriaLoadingProgress(),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TypeAheadField(
                              controller: _controller,
                              builder: (context, controller, focusNode) {
                                return TextField(
                                  controller: controller,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                    border: inputBorder,
                                    enabledBorder: inputBorder,
                                    focusedBorder: inputBorder,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: OriaColors.disabledColor,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    filled: true,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: OriaColors.disabledColor,
                                        ),
                                    fillColor: Colors.white,
                                    labelText: AppLocalizations.of(context)!
                                        .searchSpecialist,
                                  ),
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        experts = expertState.specialtyExperts;
                                      });
                                    }
                                  },
                                );
                              },
                              suggestionsCallback: (pattern) {
                                return expertState.specialtyExperts
                                    .where((expert) =>
                                        (expert.firstName
                                            .toLowerCase()
                                            .contains(pattern.toLowerCase())) ||
                                        (expert.lastName
                                            .toLowerCase()
                                            .contains(pattern.toLowerCase())))
                                    .toList();
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text(
                                    "${suggestion.firstName} ${suggestion.lastName}",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                );
                              },
                              onSelected: (suggestion) {
                                setState(() {
                                  _controller.text =
                                      "${suggestion.firstName} ${suggestion.lastName}";
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (filterState.cities.isNotEmpty)
                            OriaIconButton(
                              onPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<ExpertFilterCubit>(
                                        filterContext,
                                      ),
                                      child: ExpertFilterPage(
                                        specilalties: expertState.specialties,
                                        cities: filterState.cities,
                                        selectedSpeciality:
                                            filterState.specialty,
                                        selectedCity: filterState.city,
                                        selectedRating: filterState.rating,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              url: SvgAssets.filterIcon,
                              backgroundColor: OriaColors.darkOrange,
                              size: 17,
                            )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 10,
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            if (filterState.specialty != null)
                              FilterCard(
                                title: filterState.specialty!.name,
                                onPress: () =>
                                    BlocProvider.of<ExpertFilterCubit>(
                                            filterContext)
                                        .removeFilter(Specialty),
                              ),
                            if (filterState.city != null)
                              FilterCard(
                                title: filterState.city!.name,
                                onPress: () =>
                                    BlocProvider.of<ExpertFilterCubit>(
                                            filterContext)
                                        .removeFilter(City),
                              ),
                            if (filterState.rating != null)
                              FilterCard(
                                title:
                                    "${filterState.rating!} ${AppLocalizations.of(context)!.andUp}",
                                onPress: () =>
                                    BlocProvider.of<ExpertFilterCubit>(
                                            filterContext)
                                        .removeFilter(Int),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Visibility(
                        visible: experts.isNotEmpty,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ExpertDetailedCard(
                            expert: experts[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: experts.length,
                        ),
                      ),
                      Visibility(
                        visible: experts.isEmpty &&
                            expertState is! SpecialityExpertLoading,
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            SvgPicture.asset(
                              SvgAssets.noResultFoundAsset,
                              height: 230,
                            ),
                            const SizedBox(height: 45),
                            Text(
                              AppLocalizations.of(context)!.noResultsFound,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              AppLocalizations.of(context)!.adjustFilter,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: OriaRoundedButton(
                                onPress: () =>
                                    BlocProvider.of<ExpertFilterCubit>(
                                            filterContext)
                                        .resetFilters(),
                                text:
                                    AppLocalizations.of(context)!.clearFilters,
                                primaryColor: OriaColors.secondaryOrange,
                                padding: EdgeInsets.zero,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
