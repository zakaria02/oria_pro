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
    ExpertDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ExpertDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExpertDetailsPage(
          key: args.key,
          expert: args.expert,
        ),
      );
    },
    ExpertFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ExpertFilterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExpertFilterPage(
          key: args.key,
          specilalties: args.specilalties,
          selectedSpeciality: args.selectedSpeciality,
        ),
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
      final args = routeData.argsAs<SectionDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SectionDetailsPage(
          key: args.key,
          programName: args.programName,
          author: args.author,
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
    UpdateMyInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateMyInfoPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyEmailPage(
          key: args.key,
          email: args.email,
          steps: args.steps,
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
/// [ExpertDetailsPage]
class ExpertDetailsRoute extends PageRouteInfo<ExpertDetailsRouteArgs> {
  ExpertDetailsRoute({
    Key? key,
    required Expert expert,
    List<PageRouteInfo>? children,
  }) : super(
          ExpertDetailsRoute.name,
          args: ExpertDetailsRouteArgs(
            key: key,
            expert: expert,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpertDetailsRoute';

  static const PageInfo<ExpertDetailsRouteArgs> page =
      PageInfo<ExpertDetailsRouteArgs>(name);
}

class ExpertDetailsRouteArgs {
  const ExpertDetailsRouteArgs({
    this.key,
    required this.expert,
  });

  final Key? key;

  final Expert expert;

  @override
  String toString() {
    return 'ExpertDetailsRouteArgs{key: $key, expert: $expert}';
  }
}

/// generated route for
/// [ExpertFilterPage]
class ExpertFilterRoute extends PageRouteInfo<ExpertFilterRouteArgs> {
  ExpertFilterRoute({
    Key? key,
    required List<Specialty> specilalties,
    required Specialty? selectedSpeciality,
    List<PageRouteInfo>? children,
  }) : super(
          ExpertFilterRoute.name,
          args: ExpertFilterRouteArgs(
            key: key,
            specilalties: specilalties,
            selectedSpeciality: selectedSpeciality,
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
    required this.selectedSpeciality,
  });

  final Key? key;

  final List<Specialty> specilalties;

  final Specialty? selectedSpeciality;

  @override
  String toString() {
    return 'ExpertFilterRouteArgs{key: $key, specilalties: $specilalties, selectedSpeciality: $selectedSpeciality}';
  }
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
    required Author author,
    List<PageRouteInfo>? children,
  }) : super(
          SectionDetailsRoute.name,
          args: SectionDetailsRouteArgs(
            key: key,
            programName: programName,
            author: author,
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
    required this.author,
  });

  final Key? key;

  final String? programName;

  final Author author;

  @override
  String toString() {
    return 'SectionDetailsRouteArgs{key: $key, programName: $programName, author: $author}';
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
/// [VerifyEmailPage]
class VerifyEmailRoute extends PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    Key? key,
    required String email,
    required OnBoardingSteps steps,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(
            key: key,
            email: email,
            steps: steps,
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
    required this.steps,
  });

  final Key? key;

  final String email;

  final OnBoardingSteps steps;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, email: $email, steps: $steps}';
  }
}
