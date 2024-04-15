import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/medical_info.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_drop_down.dart';
import 'package:oria_pro/widgets/oria_loading_progress.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubit/medical_info_cubit.dart';

@RoutePage()
class MedicalInfoPage extends StatefulWidget {
  const MedicalInfoPage({super.key});

  @override
  State<MedicalInfoPage> createState() => _MedicalInfoPageState();
}

class _MedicalInfoPageState extends State<MedicalInfoPage> {
  bool isInitialized = false;
  bool changed = false;

  final List<String> menstralHistoryList = [];
  final List<String> familyHistoryList = [];
  final List<String> familyHistoryIssuesList = [];
  final List<String> undergoingHormonalTreatmentList = [];
  final List<String> contraindicationsList = [];
  final List<String> contraceptionList = [];
  final List<String> physicalActivityList = [];

  late String selectedmenstralHistory;
  late String selectedFamilyHistory;
  late String selectedFamilyHistoryIssues;
  late String selectedUndergoingHormonalTreatment;
  late String selectedContraindications;
  late String selectedContraception;
  late String selectedPhysicalActivity;

  void initData(MedicalInfo? medicalInfo) {
    if (!isInitialized) {
      menstralHistoryList.addAll([
        /*AppLocalizations.of(context)!.regularPeriods,
        AppLocalizations.of(context)!.noPeriod12Months,
        AppLocalizations.of(context)!.noPeriodDueToAContraceptive,
        AppLocalizations.of(context)!.noPeriodDueToASurgicalOperation,
        AppLocalizations.of(context)!.irregularPeriods,
        AppLocalizations.of(context)!.idk,*/
        "Regular periods",
        "No period for 12 months",
        "No period due to a contraceptive",
        "No period due to a surgical operation",
        "Irregular periods (in duration and abundance)",
        "I don’t know",
      ]);

      familyHistoryList.addAll([
        "Yes",
        "No",
      ]);

      familyHistoryIssuesList.addAll([
        /*AppLocalizations.of(context)!.none,
        AppLocalizations.of(context)!.osteoporosis,
        AppLocalizations.of(context)!.cardiovascularDiseases,
        AppLocalizations.of(context)!.weightGain,
        AppLocalizations.of(context)!.diabetes,
        AppLocalizations.of(context)!.breastCancer,
        AppLocalizations.of(context)!.hypertension,
        AppLocalizations.of(context)!.thyroidDisorders,
        AppLocalizations.of(context)!.other,*/
        "None",
        "Osteoporosis",
        "Cardiovascular Diseases",
        "Weight Gain",
        "Diabetes",
        "Breast Cancer",
        "Hypertension",
        "Thyroid Disorders",
        "Other"
      ]);

      undergoingHormonalTreatmentList.addAll([
        /*AppLocalizations.of(context)!.yes,
        AppLocalizations.of(context)!.no,*/
        "Yes",
        "No",
      ]);

      contraindicationsList.addAll([
        /*AppLocalizations.of(context)!.yes,
        AppLocalizations.of(context)!.no,*/
        "Yes",
        "No",
      ]);

      contraceptionList.addAll([
        /*AppLocalizations.of(context)!.none,
        AppLocalizations.of(context)!.combinedPill,
        AppLocalizations.of(context)!.vaginalRing,
        AppLocalizations.of(context)!.contraceptivePatch,
        AppLocalizations.of(context)!.miniPill,
        AppLocalizations.of(context)!.hormonalIUD,
        AppLocalizations.of(context)!.copperIUD,
        AppLocalizations.of(context)!.contraceptiveImplant,
        AppLocalizations.of(context)!.other,*/
        "None",
        "Combined pill",
        "Vaginal ring",
        "Contraceptive patch",
        "Mini pill",
        "Hormonal IUD",
        "Copper IUD",
        "Contraceptive implant",
        "Other",
      ]);

      physicalActivityList.addAll([
        /*AppLocalizations.of(context)!.none,
        AppLocalizations.of(context)!.yoga,
        AppLocalizations.of(context)!.hormonalYoga,
        AppLocalizations.of(context)!.pilates,
        AppLocalizations.of(context)!.walking,
        AppLocalizations.of(context)!.targetedWeightTraining,
        AppLocalizations.of(context)!.cardio,
        AppLocalizations.of(context)!.other,*/
        "None",
        "Yoga",
        "Hormonal yoga",
        "Pilates",
        "Walking",
        "Targeted weight training",
        "Cardio",
        "Other",
      ]);
    }

    if (medicalInfo != null) {
      selectedmenstralHistory = medicalInfo.menstralHistory;
      selectedFamilyHistory = medicalInfo.familyHistory;
      selectedFamilyHistoryIssues = medicalInfo.familyHistoryIssues;
      selectedUndergoingHormonalTreatment =
          medicalInfo.undergoingHormonalTreatment;
      selectedContraindications = medicalInfo.contraindications;
      selectedContraception = medicalInfo.contraception;
      selectedPhysicalActivity = medicalInfo.physicalActivity;
    } else {
      selectedmenstralHistory = menstralHistoryList.first;
      selectedFamilyHistory = familyHistoryList.first;
      selectedFamilyHistoryIssues = familyHistoryIssuesList.first;
      selectedUndergoingHormonalTreatment =
          undergoingHormonalTreatmentList.first;
      selectedContraindications = contraindicationsList.first;
      selectedContraception = contraceptionList.first;
      selectedPhysicalActivity = physicalActivityList.first;
    }

    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalInfoCubit()..getMedicalInfo(),
      child: BlocConsumer<MedicalInfoCubit, MedicalInfoState>(
        listener: (context, state) {
          initData(state.medicalInfo);
          if (state is SendMedicalInfoSuccess) {
            context.router.maybePop();
          }
        },
        builder: (context, state) {
          if (!isInitialized) {
            initData(state.medicalInfo);
          }
          return OriaScaffold(
            appBarData: AppBarData(
              firstButtonUrl: SvgAssets.backAsset,
              onFirstButtonPress: () => context.maybePop(),
              title: AppLocalizations.of(context)!.medicalInfo,
            ),
            body: state is MedicalInfoLoading
                ? const OriaLoadingProgress()
                : Expanded(
                    child: ListView(
                      children: [
                        OriaCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.menstralHistory,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: menstralHistoryList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedmenstralHistory = value;
                                    });
                                  }
                                },
                                selectedItem: selectedmenstralHistory,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!.familyHistory,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: familyHistoryList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedFamilyHistory = value;
                                    });
                                  }
                                },
                                selectedItem: selectedFamilyHistory,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!
                                    .familyHistoryIssues,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: familyHistoryIssuesList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedFamilyHistoryIssues = value;
                                    });
                                  }
                                },
                                selectedItem: selectedFamilyHistoryIssues,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!
                                    .undergoingHormonalTreatment,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: undergoingHormonalTreatmentList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedUndergoingHormonalTreatment =
                                          value;
                                    });
                                  }
                                },
                                selectedItem:
                                    selectedUndergoingHormonalTreatment,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!.contraindications,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: contraindicationsList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedContraindications = value;
                                    });
                                  }
                                },
                                selectedItem: selectedContraindications,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!.contraception,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: contraceptionList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedContraception = value;
                                    });
                                  }
                                },
                                selectedItem: selectedContraception,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!.physicalActivity,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 12),
                              OriaDropDown<String>(
                                items: physicalActivityList,
                                onValueChange: (value) {
                                  if (value != null) {
                                    setState(() {
                                      changed = true;
                                      selectedPhysicalActivity = value;
                                    });
                                  }
                                },
                                selectedItem: selectedPhysicalActivity,
                              ),
                              const SizedBox(height: 24),
                              OriaRoundedButton(
                                onPress: () {
                                  final medicalInfo = MedicalInfo(
                                      menstralHistory: selectedmenstralHistory,
                                      familyHistory: selectedFamilyHistory,
                                      familyHistoryIssues:
                                          selectedFamilyHistoryIssues,
                                      undergoingHormonalTreatment:
                                          selectedUndergoingHormonalTreatment,
                                      contraindications:
                                          selectedContraindications,
                                      contraception: selectedContraception,
                                      physicalActivity:
                                          selectedPhysicalActivity);
                                  if (state.medicalInfo == null) {
                                    BlocProvider.of<MedicalInfoCubit>(context)
                                        .addMedicalInfo(medicalInfo);
                                  } else {
                                    BlocProvider.of<MedicalInfoCubit>(context)
                                        .updateMedicalInfo(medicalInfo);
                                  }
                                },
                                text: AppLocalizations.of(context)!.saveChanges,
                                disabled:
                                    !changed || state is SendMedicalInfoLoading,
                                isLoading: state is SendMedicalInfoLoading,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
