// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppOrchestratorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppOrchestratorPage(),
      );
    },
    AppointmentCallRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentCallRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppointmentCallPage(
          key: args.key,
          appointment: args.appointment,
          onLeave: args.onLeave,
        ),
      );
    },
    AppointmentRefundingRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentRefundingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppointmentRefundingPage(
          key: args.key,
          appointment: args.appointment,
        ),
      );
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticlePage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ClientAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientAppPage(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateAccountPage(),
      );
    },
    EditMySymptomsRoute.name: (routeData) {
      final args = routeData.argsAs<EditMySymptomsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditMySymptomsPage(
          key: args.key,
          refresh: args.refresh,
          refreshTodaysAction: args.refreshTodaysAction,
        ),
      );
    },
    ExpertDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExpertDetailsPage(),
      );
    },
    ExpertFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ExpertFilterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExpertFilterPage(
          key: args.key,
          specilalties: args.specilalties,
          cities: args.cities,
          selectedSpeciality: args.selectedSpeciality,
          selectedCity: args.selectedCity,
          selectedRating: args.selectedRating,
          provinces: args.provinces,
          selectedProvince: args.selectedProvince,
        ),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesPage(),
      );
    },
    FindSpecialistRoute.name: (routeData) {
      final args = routeData.argsAs<FindSpecialistRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FindSpecialistPage(
          key: args.key,
          specialty: args.specialty,
        ),
      );
    },
    ForgotPasswordEmailRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgotPasswordEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MakeAppointmentRoute.name: (routeData) {
      final args = routeData.argsAs<MakeAppointmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MakeAppointmentPage(
          key: args.key,
          expert: args.expert,
        ),
      );
    },
    MakeAppointmentSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<MakeAppointmentSuccessRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MakeAppointmentSuccessPage(
          key: args.key,
          appointment: args.appointment,
        ),
      );
    },
    MedicalInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MedicalInfoPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewPasswordPage(
          key: args.key,
          token: args.token,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsPage(),
      );
    },
    OnBoardingStepsRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingStepsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnBoardingStepsPage(
          key: args.key,
          steps: args.steps,
        ),
      );
    },
    PrimarySymptomRoute.name: (routeData) {
      final args = routeData.argsAs<PrimarySymptomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrimarySymptomPage(
          key: args.key,
          onboardingStepsCubit: args.onboardingStepsCubit,
        ),
      );
    },
    PrimarySymptomsProgramsRoute.name: (routeData) {
      final args = routeData.argsAs<PrimarySymptomsProgramsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrimarySymptomsProgramsPage(
          key: args.key,
          onboardingStepsCubit: args.onboardingStepsCubit,
        ),
      );
    },
    ProfilCalculationRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilCalculationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilCalculationPage(
          key: args.key,
          progress: args.progress,
          onboardingStepsCubit: args.onboardingStepsCubit,
        ),
      );
    },
    ProgramDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProgramDetailsPage(),
      );
    },
    ProgramSectionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProgramSectionsPage(),
      );
    },
    SecondarySymptomsRoute.name: (routeData) {
      final args = routeData.argsAs<SecondarySymptomsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SecondarySymptomsPage(
          key: args.key,
          onboardingStepsCubit: args.onboardingStepsCubit,
        ),
      );
    },
    SectionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SectionDetailsRouteArgs>(
          orElse: () => const SectionDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SectionDetailsPage(
          key: args.key,
          programName: args.programName,
          section: args.section,
        ),
      );
    },
    SymptomDataRoute.name: (routeData) {
      final args = routeData.argsAs<SymptomDataRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SymptomDataPage(
          key: args.key,
          symptom: args.symptom,
        ),
      );
    },
    SymptomsListRoute.name: (routeData) {
      final args = routeData.argsAs<SymptomsListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SymptomsListPage(
          key: args.key,
          symptoms: args.symptoms,
        ),
      );
    },
    UpcomingDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UpcomingDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpcomingDetailsPage(
          key: args.key,
          appointment: args.appointment,
        ),
      );
    },
    UpdateMyInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateMyInfoPage(),
      );
    },
    UpdatePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdatePasswordPage(),
      );
    },
    UpdatePrimarySymptomRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePrimarySymptomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdatePrimarySymptomPage(
          key: args.key,
          currentSymptom: args.currentSymptom,
          refresh: args.refresh,
          refreshTodaysAction: args.refreshTodaysAction,
        ),
      );
    },
    UpdateSecondarySymptomsRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateSecondarySymptomsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateSecondarySymptomsPage(
          key: args.key,
          currentSymptoms: args.currentSymptoms,
          primarySymptom: args.primarySymptom,
          refresh: args.refresh,
        ),
      );
    },
    UpdateTodaysActionsProgramRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTodaysActionsProgramRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateTodaysActionsProgramPage(
          key: args.key,
          refresh: args.refresh,
        ),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
  };
}

/// generated route for
/// [AppOrchestratorPage]
class AppOrchestratorRoute extends PageRouteInfo<void> {
  const AppOrchestratorRoute({List<PageRouteInfo>? children})
      : super(
          AppOrchestratorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppOrchestratorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppointmentCallPage]
class AppointmentCallRoute extends PageRouteInfo<AppointmentCallRouteArgs> {
  AppointmentCallRoute({
    Key? key,
    required AppointmentDetails appointment,
    required void Function() onLeave,
    List<PageRouteInfo>? children,
  }) : super(
          AppointmentCallRoute.name,
          args: AppointmentCallRouteArgs(
            key: key,
            appointment: appointment,
            onLeave: onLeave,
          ),
          initialChildren: children,
        );

  static const String name = 'AppointmentCallRoute';

  static const PageInfo<AppointmentCallRouteArgs> page =
      PageInfo<AppointmentCallRouteArgs>(name);
}

class AppointmentCallRouteArgs {
  const AppointmentCallRouteArgs({
    this.key,
    required this.appointment,
    required this.onLeave,
  });

  final Key? key;

  final AppointmentDetails appointment;

  final void Function() onLeave;

  @override
  String toString() {
    return 'AppointmentCallRouteArgs{key: $key, appointment: $appointment, onLeave: $onLeave}';
  }
}

/// generated route for
/// [AppointmentRefundingPage]
class AppointmentRefundingRoute
    extends PageRouteInfo<AppointmentRefundingRouteArgs> {
  AppointmentRefundingRoute({
    Key? key,
    required AppointmentDetails appointment,
    List<PageRouteInfo>? children,
  }) : super(
          AppointmentRefundingRoute.name,
          args: AppointmentRefundingRouteArgs(
            key: key,
            appointment: appointment,
          ),
          initialChildren: children,
        );

  static const String name = 'AppointmentRefundingRoute';

  static const PageInfo<AppointmentRefundingRouteArgs> page =
      PageInfo<AppointmentRefundingRouteArgs>(name);
}

class AppointmentRefundingRouteArgs {
  const AppointmentRefundingRouteArgs({
    this.key,
    required this.appointment,
  });

  final Key? key;

  final AppointmentDetails appointment;

  @override
  String toString() {
    return 'AppointmentRefundingRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [ArticlePage]
class ArticleRoute extends PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          ArticleRoute.name,
          args: ArticleRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleRoute';

  static const PageInfo<ArticleRouteArgs> page =
      PageInfo<ArticleRouteArgs>(name);
}

class ArticleRouteArgs {
  const ArticleRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ClientAppPage]
class ClientAppRoute extends PageRouteInfo<void> {
  const ClientAppRoute({List<PageRouteInfo>? children})
      : super(
          ClientAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateAccountPage]
class CreateAccountRoute extends PageRouteInfo<void> {
  const CreateAccountRoute({List<PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditMySymptomsPage]
class EditMySymptomsRoute extends PageRouteInfo<EditMySymptomsRouteArgs> {
  EditMySymptomsRoute({
    Key? key,
    required void Function() refresh,
    required void Function() refreshTodaysAction,
    List<PageRouteInfo>? children,
  }) : super(
          EditMySymptomsRoute.name,
          args: EditMySymptomsRouteArgs(
            key: key,
            refresh: refresh,
            refreshTodaysAction: refreshTodaysAction,
          ),
          initialChildren: children,
        );

  static const String name = 'EditMySymptomsRoute';

  static const PageInfo<EditMySymptomsRouteArgs> page =
      PageInfo<EditMySymptomsRouteArgs>(name);
}

class EditMySymptomsRouteArgs {
  const EditMySymptomsRouteArgs({
    this.key,
    required this.refresh,
    required this.refreshTodaysAction,
  });

  final Key? key;

  final void Function() refresh;

  final void Function() refreshTodaysAction;

  @override
  String toString() {
    return 'EditMySymptomsRouteArgs{key: $key, refresh: $refresh, refreshTodaysAction: $refreshTodaysAction}';
  }
}

/// generated route for
/// [ExpertDetailsPage]
class ExpertDetailsRoute extends PageRouteInfo<void> {
  const ExpertDetailsRoute({List<PageRouteInfo>? children})
      : super(
          ExpertDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpertDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExpertFilterPage]
class ExpertFilterRoute extends PageRouteInfo<ExpertFilterRouteArgs> {
  ExpertFilterRoute({
    Key? key,
    required List<Specialty> specilalties,
    required List<City> cities,
    required Specialty? selectedSpeciality,
    required City? selectedCity,
    required int? selectedRating,
    required List<Province> provinces,
    required Province? selectedProvince,
    List<PageRouteInfo>? children,
  }) : super(
          ExpertFilterRoute.name,
          args: ExpertFilterRouteArgs(
            key: key,
            specilalties: specilalties,
            cities: cities,
            selectedSpeciality: selectedSpeciality,
            selectedCity: selectedCity,
            selectedRating: selectedRating,
            provinces: provinces,
            selectedProvince: selectedProvince,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpertFilterRoute';

  static const PageInfo<ExpertFilterRouteArgs> page =
      PageInfo<ExpertFilterRouteArgs>(name);
}

class ExpertFilterRouteArgs {
  const ExpertFilterRouteArgs({
    this.key,
    required this.specilalties,
    required this.cities,
    required this.selectedSpeciality,
    required this.selectedCity,
    required this.selectedRating,
    required this.provinces,
    required this.selectedProvince,
  });

  final Key? key;

  final List<Specialty> specilalties;

  final List<City> cities;

  final Specialty? selectedSpeciality;

  final City? selectedCity;

  final int? selectedRating;

  final List<Province> provinces;

  final Province? selectedProvince;

  @override
  String toString() {
    return 'ExpertFilterRouteArgs{key: $key, specilalties: $specilalties, cities: $cities, selectedSpeciality: $selectedSpeciality, selectedCity: $selectedCity, selectedRating: $selectedRating, provinces: $provinces, selectedProvince: $selectedProvince}';
  }
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindSpecialistPage]
class FindSpecialistRoute extends PageRouteInfo<FindSpecialistRouteArgs> {
  FindSpecialistRoute({
    Key? key,
    required Specialty specialty,
    List<PageRouteInfo>? children,
  }) : super(
          FindSpecialistRoute.name,
          args: FindSpecialistRouteArgs(
            key: key,
            specialty: specialty,
          ),
          initialChildren: children,
        );

  static const String name = 'FindSpecialistRoute';

  static const PageInfo<FindSpecialistRouteArgs> page =
      PageInfo<FindSpecialistRouteArgs>(name);
}

class FindSpecialistRouteArgs {
  const FindSpecialistRouteArgs({
    this.key,
    required this.specialty,
  });

  final Key? key;

  final Specialty specialty;

  @override
  String toString() {
    return 'FindSpecialistRouteArgs{key: $key, specialty: $specialty}';
  }
}

/// generated route for
/// [ForgotPasswordEmailPage]
class ForgotPasswordEmailRoute
    extends PageRouteInfo<ForgotPasswordEmailRouteArgs> {
  ForgotPasswordEmailRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotPasswordEmailRoute.name,
          args: ForgotPasswordEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordEmailRoute';

  static const PageInfo<ForgotPasswordEmailRouteArgs> page =
      PageInfo<ForgotPasswordEmailRouteArgs>(name);
}

class ForgotPasswordEmailRouteArgs {
  const ForgotPasswordEmailRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPasswordEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MakeAppointmentPage]
class MakeAppointmentRoute extends PageRouteInfo<MakeAppointmentRouteArgs> {
  MakeAppointmentRoute({
    Key? key,
    required Expert expert,
    List<PageRouteInfo>? children,
  }) : super(
          MakeAppointmentRoute.name,
          args: MakeAppointmentRouteArgs(
            key: key,
            expert: expert,
          ),
          initialChildren: children,
        );

  static const String name = 'MakeAppointmentRoute';

  static const PageInfo<MakeAppointmentRouteArgs> page =
      PageInfo<MakeAppointmentRouteArgs>(name);
}

class MakeAppointmentRouteArgs {
  const MakeAppointmentRouteArgs({
    this.key,
    required this.expert,
  });

  final Key? key;

  final Expert expert;

  @override
  String toString() {
    return 'MakeAppointmentRouteArgs{key: $key, expert: $expert}';
  }
}

/// generated route for
/// [MakeAppointmentSuccessPage]
class MakeAppointmentSuccessRoute
    extends PageRouteInfo<MakeAppointmentSuccessRouteArgs> {
  MakeAppointmentSuccessRoute({
    Key? key,
    required Appointment appointment,
    List<PageRouteInfo>? children,
  }) : super(
          MakeAppointmentSuccessRoute.name,
          args: MakeAppointmentSuccessRouteArgs(
            key: key,
            appointment: appointment,
          ),
          initialChildren: children,
        );

  static const String name = 'MakeAppointmentSuccessRoute';

  static const PageInfo<MakeAppointmentSuccessRouteArgs> page =
      PageInfo<MakeAppointmentSuccessRouteArgs>(name);
}

class MakeAppointmentSuccessRouteArgs {
  const MakeAppointmentSuccessRouteArgs({
    this.key,
    required this.appointment,
  });

  final Key? key;

  final Appointment appointment;

  @override
  String toString() {
    return 'MakeAppointmentSuccessRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [MedicalInfoPage]
class MedicalInfoRoute extends PageRouteInfo<void> {
  const MedicalInfoRoute({List<PageRouteInfo>? children})
      : super(
          MedicalInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicalInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<NewPasswordRouteArgs> page =
      PageInfo<NewPasswordRouteArgs>(name);
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.token,
  });

  final Key? key;

  final String token;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingStepsPage]
class OnBoardingStepsRoute extends PageRouteInfo<OnBoardingStepsRouteArgs> {
  OnBoardingStepsRoute({
    Key? key,
    required OnBoardingSteps steps,
    List<PageRouteInfo>? children,
  }) : super(
          OnBoardingStepsRoute.name,
          args: OnBoardingStepsRouteArgs(
            key: key,
            steps: steps,
          ),
          initialChildren: children,
        );

  static const String name = 'OnBoardingStepsRoute';

  static const PageInfo<OnBoardingStepsRouteArgs> page =
      PageInfo<OnBoardingStepsRouteArgs>(name);
}

class OnBoardingStepsRouteArgs {
  const OnBoardingStepsRouteArgs({
    this.key,
    required this.steps,
  });

  final Key? key;

  final OnBoardingSteps steps;

  @override
  String toString() {
    return 'OnBoardingStepsRouteArgs{key: $key, steps: $steps}';
  }
}

/// generated route for
/// [PrimarySymptomPage]
class PrimarySymptomRoute extends PageRouteInfo<PrimarySymptomRouteArgs> {
  PrimarySymptomRoute({
    Key? key,
    required OnboardingStepsCubit onboardingStepsCubit,
    List<PageRouteInfo>? children,
  }) : super(
          PrimarySymptomRoute.name,
          args: PrimarySymptomRouteArgs(
            key: key,
            onboardingStepsCubit: onboardingStepsCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'PrimarySymptomRoute';

  static const PageInfo<PrimarySymptomRouteArgs> page =
      PageInfo<PrimarySymptomRouteArgs>(name);
}

class PrimarySymptomRouteArgs {
  const PrimarySymptomRouteArgs({
    this.key,
    required this.onboardingStepsCubit,
  });

  final Key? key;

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  String toString() {
    return 'PrimarySymptomRouteArgs{key: $key, onboardingStepsCubit: $onboardingStepsCubit}';
  }
}

/// generated route for
/// [PrimarySymptomsProgramsPage]
class PrimarySymptomsProgramsRoute
    extends PageRouteInfo<PrimarySymptomsProgramsRouteArgs> {
  PrimarySymptomsProgramsRoute({
    Key? key,
    required OnboardingStepsCubit onboardingStepsCubit,
    List<PageRouteInfo>? children,
  }) : super(
          PrimarySymptomsProgramsRoute.name,
          args: PrimarySymptomsProgramsRouteArgs(
            key: key,
            onboardingStepsCubit: onboardingStepsCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'PrimarySymptomsProgramsRoute';

  static const PageInfo<PrimarySymptomsProgramsRouteArgs> page =
      PageInfo<PrimarySymptomsProgramsRouteArgs>(name);
}

class PrimarySymptomsProgramsRouteArgs {
  const PrimarySymptomsProgramsRouteArgs({
    this.key,
    required this.onboardingStepsCubit,
  });

  final Key? key;

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  String toString() {
    return 'PrimarySymptomsProgramsRouteArgs{key: $key, onboardingStepsCubit: $onboardingStepsCubit}';
  }
}

/// generated route for
/// [ProfilCalculationPage]
class ProfilCalculationRoute extends PageRouteInfo<ProfilCalculationRouteArgs> {
  ProfilCalculationRoute({
    Key? key,
    required double progress,
    required OnboardingStepsCubit onboardingStepsCubit,
    List<PageRouteInfo>? children,
  }) : super(
          ProfilCalculationRoute.name,
          args: ProfilCalculationRouteArgs(
            key: key,
            progress: progress,
            onboardingStepsCubit: onboardingStepsCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilCalculationRoute';

  static const PageInfo<ProfilCalculationRouteArgs> page =
      PageInfo<ProfilCalculationRouteArgs>(name);
}

class ProfilCalculationRouteArgs {
  const ProfilCalculationRouteArgs({
    this.key,
    required this.progress,
    required this.onboardingStepsCubit,
  });

  final Key? key;

  final double progress;

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  String toString() {
    return 'ProfilCalculationRouteArgs{key: $key, progress: $progress, onboardingStepsCubit: $onboardingStepsCubit}';
  }
}

/// generated route for
/// [ProgramDetailsPage]
class ProgramDetailsRoute extends PageRouteInfo<void> {
  const ProgramDetailsRoute({List<PageRouteInfo>? children})
      : super(
          ProgramDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProgramDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProgramSectionsPage]
class ProgramSectionsRoute extends PageRouteInfo<void> {
  const ProgramSectionsRoute({List<PageRouteInfo>? children})
      : super(
          ProgramSectionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProgramSectionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecondarySymptomsPage]
class SecondarySymptomsRoute extends PageRouteInfo<SecondarySymptomsRouteArgs> {
  SecondarySymptomsRoute({
    Key? key,
    required OnboardingStepsCubit onboardingStepsCubit,
    List<PageRouteInfo>? children,
  }) : super(
          SecondarySymptomsRoute.name,
          args: SecondarySymptomsRouteArgs(
            key: key,
            onboardingStepsCubit: onboardingStepsCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'SecondarySymptomsRoute';

  static const PageInfo<SecondarySymptomsRouteArgs> page =
      PageInfo<SecondarySymptomsRouteArgs>(name);
}

class SecondarySymptomsRouteArgs {
  const SecondarySymptomsRouteArgs({
    this.key,
    required this.onboardingStepsCubit,
  });

  final Key? key;

  final OnboardingStepsCubit onboardingStepsCubit;

  @override
  String toString() {
    return 'SecondarySymptomsRouteArgs{key: $key, onboardingStepsCubit: $onboardingStepsCubit}';
  }
}

/// generated route for
/// [SectionDetailsPage]
class SectionDetailsRoute extends PageRouteInfo<SectionDetailsRouteArgs> {
  SectionDetailsRoute({
    Key? key,
    String? programName,
    ProgramSectionWithContent? section,
    List<PageRouteInfo>? children,
  }) : super(
          SectionDetailsRoute.name,
          args: SectionDetailsRouteArgs(
            key: key,
            programName: programName,
            section: section,
          ),
          initialChildren: children,
        );

  static const String name = 'SectionDetailsRoute';

  static const PageInfo<SectionDetailsRouteArgs> page =
      PageInfo<SectionDetailsRouteArgs>(name);
}

class SectionDetailsRouteArgs {
  const SectionDetailsRouteArgs({
    this.key,
    this.programName,
    this.section,
  });

  final Key? key;

  final String? programName;

  final ProgramSectionWithContent? section;

  @override
  String toString() {
    return 'SectionDetailsRouteArgs{key: $key, programName: $programName, section: $section}';
  }
}

/// generated route for
/// [SymptomDataPage]
class SymptomDataRoute extends PageRouteInfo<SymptomDataRouteArgs> {
  SymptomDataRoute({
    Key? key,
    required Symptom symptom,
    List<PageRouteInfo>? children,
  }) : super(
          SymptomDataRoute.name,
          args: SymptomDataRouteArgs(
            key: key,
            symptom: symptom,
          ),
          initialChildren: children,
        );

  static const String name = 'SymptomDataRoute';

  static const PageInfo<SymptomDataRouteArgs> page =
      PageInfo<SymptomDataRouteArgs>(name);
}

class SymptomDataRouteArgs {
  const SymptomDataRouteArgs({
    this.key,
    required this.symptom,
  });

  final Key? key;

  final Symptom symptom;

  @override
  String toString() {
    return 'SymptomDataRouteArgs{key: $key, symptom: $symptom}';
  }
}

/// generated route for
/// [SymptomsListPage]
class SymptomsListRoute extends PageRouteInfo<SymptomsListRouteArgs> {
  SymptomsListRoute({
    Key? key,
    required List<Symptom> symptoms,
    List<PageRouteInfo>? children,
  }) : super(
          SymptomsListRoute.name,
          args: SymptomsListRouteArgs(
            key: key,
            symptoms: symptoms,
          ),
          initialChildren: children,
        );

  static const String name = 'SymptomsListRoute';

  static const PageInfo<SymptomsListRouteArgs> page =
      PageInfo<SymptomsListRouteArgs>(name);
}

class SymptomsListRouteArgs {
  const SymptomsListRouteArgs({
    this.key,
    required this.symptoms,
  });

  final Key? key;

  final List<Symptom> symptoms;

  @override
  String toString() {
    return 'SymptomsListRouteArgs{key: $key, symptoms: $symptoms}';
  }
}

/// generated route for
/// [UpcomingDetailsPage]
class UpcomingDetailsRoute extends PageRouteInfo<UpcomingDetailsRouteArgs> {
  UpcomingDetailsRoute({
    Key? key,
    required AppointmentDetails appointment,
    List<PageRouteInfo>? children,
  }) : super(
          UpcomingDetailsRoute.name,
          args: UpcomingDetailsRouteArgs(
            key: key,
            appointment: appointment,
          ),
          initialChildren: children,
        );

  static const String name = 'UpcomingDetailsRoute';

  static const PageInfo<UpcomingDetailsRouteArgs> page =
      PageInfo<UpcomingDetailsRouteArgs>(name);
}

class UpcomingDetailsRouteArgs {
  const UpcomingDetailsRouteArgs({
    this.key,
    required this.appointment,
  });

  final Key? key;

  final AppointmentDetails appointment;

  @override
  String toString() {
    return 'UpcomingDetailsRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [UpdateMyInfoPage]
class UpdateMyInfoRoute extends PageRouteInfo<void> {
  const UpdateMyInfoRoute({List<PageRouteInfo>? children})
      : super(
          UpdateMyInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateMyInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdatePasswordPage]
class UpdatePasswordRoute extends PageRouteInfo<void> {
  const UpdatePasswordRoute({List<PageRouteInfo>? children})
      : super(
          UpdatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdatePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdatePrimarySymptomPage]
class UpdatePrimarySymptomRoute
    extends PageRouteInfo<UpdatePrimarySymptomRouteArgs> {
  UpdatePrimarySymptomRoute({
    Key? key,
    required Symptom currentSymptom,
    required void Function() refresh,
    required void Function() refreshTodaysAction,
    List<PageRouteInfo>? children,
  }) : super(
          UpdatePrimarySymptomRoute.name,
          args: UpdatePrimarySymptomRouteArgs(
            key: key,
            currentSymptom: currentSymptom,
            refresh: refresh,
            refreshTodaysAction: refreshTodaysAction,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePrimarySymptomRoute';

  static const PageInfo<UpdatePrimarySymptomRouteArgs> page =
      PageInfo<UpdatePrimarySymptomRouteArgs>(name);
}

class UpdatePrimarySymptomRouteArgs {
  const UpdatePrimarySymptomRouteArgs({
    this.key,
    required this.currentSymptom,
    required this.refresh,
    required this.refreshTodaysAction,
  });

  final Key? key;

  final Symptom currentSymptom;

  final void Function() refresh;

  final void Function() refreshTodaysAction;

  @override
  String toString() {
    return 'UpdatePrimarySymptomRouteArgs{key: $key, currentSymptom: $currentSymptom, refresh: $refresh, refreshTodaysAction: $refreshTodaysAction}';
  }
}

/// generated route for
/// [UpdateSecondarySymptomsPage]
class UpdateSecondarySymptomsRoute
    extends PageRouteInfo<UpdateSecondarySymptomsRouteArgs> {
  UpdateSecondarySymptomsRoute({
    Key? key,
    required List<Symptom> currentSymptoms,
    required Symptom? primarySymptom,
    required void Function() refresh,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateSecondarySymptomsRoute.name,
          args: UpdateSecondarySymptomsRouteArgs(
            key: key,
            currentSymptoms: currentSymptoms,
            primarySymptom: primarySymptom,
            refresh: refresh,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateSecondarySymptomsRoute';

  static const PageInfo<UpdateSecondarySymptomsRouteArgs> page =
      PageInfo<UpdateSecondarySymptomsRouteArgs>(name);
}

class UpdateSecondarySymptomsRouteArgs {
  const UpdateSecondarySymptomsRouteArgs({
    this.key,
    required this.currentSymptoms,
    required this.primarySymptom,
    required this.refresh,
  });

  final Key? key;

  final List<Symptom> currentSymptoms;

  final Symptom? primarySymptom;

  final void Function() refresh;

  @override
  String toString() {
    return 'UpdateSecondarySymptomsRouteArgs{key: $key, currentSymptoms: $currentSymptoms, primarySymptom: $primarySymptom, refresh: $refresh}';
  }
}

/// generated route for
/// [UpdateTodaysActionsProgramPage]
class UpdateTodaysActionsProgramRoute
    extends PageRouteInfo<UpdateTodaysActionsProgramRouteArgs> {
  UpdateTodaysActionsProgramRoute({
    Key? key,
    required void Function() refresh,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateTodaysActionsProgramRoute.name,
          args: UpdateTodaysActionsProgramRouteArgs(
            key: key,
            refresh: refresh,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTodaysActionsProgramRoute';

  static const PageInfo<UpdateTodaysActionsProgramRouteArgs> page =
      PageInfo<UpdateTodaysActionsProgramRouteArgs>(name);
}

class UpdateTodaysActionsProgramRouteArgs {
  const UpdateTodaysActionsProgramRouteArgs({
    this.key,
    required this.refresh,
  });

  final Key? key;

  final void Function() refresh;

  @override
  String toString() {
    return 'UpdateTodaysActionsProgramRouteArgs{key: $key, refresh: $refresh}';
  }
}

/// generated route for
/// [VerifyEmailPage]
class VerifyEmailRoute extends PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<VerifyEmailRouteArgs> page =
      PageInfo<VerifyEmailRouteArgs>(name);
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, email: $email}';
  }
}
