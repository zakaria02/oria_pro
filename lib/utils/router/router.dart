import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../client/client_app_page.dart';
import '../../client/moduls/explore/feature/learning/pages/article_page.dart';
import '../../client/moduls/explore/feature/programs/pages/program_details_page.dart';
import '../../client/moduls/explore/feature/programs/pages/program_sections_page.dart';
import '../../client/moduls/explore/feature/programs/pages/section_details_page.dart';
import '../../common/app_orchestrator/app_orchestrator.dart';
import '../../common/auth/feature/entity/onbaording_step.dart';
import '../../common/auth/feature/pages/create_account_page.dart';
import '../../common/auth/feature/pages/forgot_password_page.dart';
import '../../common/auth/feature/pages/login_page.dart';
import '../../common/entity/author.dart';
import '../../common/onboarding/feature/cubit/onboarding_steps_cubit.dart';
import '../../common/onboarding/feature/pages/on_boarding_steps_page.dart';
import '../../common/email_verification/feature/verify_email_page.dart';
import '../../common/symptoms/feature/entity/symptom.dart';
import '../../common/symptoms/feature/pages/primary_symptom_programs_page.dart';
import '../../common/onboarding/feature/pages/profil_calculation_page.dart';
import '../../common/symptoms/feature/pages/primary_symptom_page.dart';
import '../../common/symptoms/feature/pages/secondary_symptoms_page.dart';
import '../../common/symptoms/feature/pages/symptom_data_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final List<AutoRoute> _authRoutes = [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: CreateAccountRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: OnBoardingStepsRoute.page),
    AutoRoute(page: ProfilCalculationRoute.page),
    AutoRoute(page: VerifyEmailRoute.page),
  ];

  final _clientAppRoutes = [
    // Main route
    AutoRoute(page: ClientAppRoute.page),
    // Explore routes
    AutoRoute(page: ArticleRoute.page),
    AutoRoute(page: ProgramDetailsRoute.page),
    AutoRoute(page: ProgramSectionsRoute.page),
    AutoRoute(page: ProgramDetailsRoute.page),
    AutoRoute(page: ProgramSectionsRoute.page),
    AutoRoute(page: SectionDetailsRoute.page),
    // Home routes
    AutoRoute(page: SymptomDataRoute.page)
  ];

  final List<AutoRoute> _symptomRoutes = [];
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppOrchestratorRoute.page, initial: true),
        ..._authRoutes,
        ..._symptomRoutes,
        ..._clientAppRoutes,
      ];
}
