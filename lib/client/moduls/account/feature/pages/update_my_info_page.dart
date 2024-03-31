import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_rounded_input.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';

import '../../../../../widgets/oria_custom_rounded_input.dart';
import '../bloc/user_bloc.dart';

@RoutePage()
class UpdateMyInfoPage extends StatefulWidget {
  const UpdateMyInfoPage({super.key});

  @override
  State<UpdateMyInfoPage> createState() => _UpdateMyInfoPageState();
}

class _UpdateMyInfoPageState extends State<UpdateMyInfoPage> {
  String name = "";
  String email = "";
  DateTime? birthDay;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UpdateUserSuccess) {
          context.maybePop();
        }
      },
      builder: (context, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: AppLocalizations.of(context)!.myInfo,
          ),
          body: Expanded(
            child: ListView(
              children: [
                OriaCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: UserImage(
                          userImage: state.currenUser?.profilePicture,
                          size: 128,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.name,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 12),
                      OriaRoundedInput(
                        initialValue: state.currenUser?.name,
                        hintText: AppLocalizations.of(context)!.name,
                        onTextChange: (tippedName) {
                          setState(() {
                            name = tippedName;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.birthday,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 12),
                      OriaCustomRoundedDateInput(
                        hintText: AppLocalizations.of(context)!.dateOfBirth,
                        currentValue: birthDay != null
                            ? birthDay?.toOriaIsoDate()
                            : state.currenUser?.birthDay?.toOriaIsoDate(),
                        onDateChange: (date) {
                          setState(() {
                            birthDay = date;
                          });
                        },
                        centerText: false,
                      ),
                      const SizedBox(height: 16),
                      /*Text(
                        AppLocalizations.of(context)!.email,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 12),
                      OriaRoundedInput(
                        initialValue: state.currenUser?.email,
                        hintText: AppLocalizations.of(context)!.email,
                        onTextChange: (tippedEmail) {
                          setState(() {
                            email = tippedEmail;
                          });
                        },
                      ),*/
                      const SizedBox(height: 16),
                      OriaRoundedButton(
                        onPress: () {
                          DateTime today = DateTime.now();
                          DateTime eighteenYearsAgo =
                              DateTime(today.year - 18, today.month, today.day);
                          if (birthDay != null) {
                            if (birthDay!.isBefore(eighteenYearsAgo) ||
                                birthDay!.isAtSameMomentAs(eighteenYearsAgo)) {
                              BlocProvider.of<UserBloc>(context).add(
                                UpdateUser(
                                  email: email,
                                  name: name,
                                  birthDay: birthDay,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  OriaErrorSnackBar(
                                      content: AppLocalizations.of(context)!
                                          .ageVerification));
                            }
                          } else {
                            BlocProvider.of<UserBloc>(context).add(
                              UpdateUser(
                                email: email,
                                name: name,
                                birthDay: birthDay,
                              ),
                            );
                          }
                        },
                        text: AppLocalizations.of(context)!.saveChanges,
                        disabled:
                            (name.isEmpty || name == state.currenUser?.name) &&
                                (email.isEmpty ||
                                    state.currenUser?.email == email) &&
                                (birthDay == null ||
                                    state.currenUser?.birthDay == birthDay),
                        isLoading: state is UpdateUserLoading,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
