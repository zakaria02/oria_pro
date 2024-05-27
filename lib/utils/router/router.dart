import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:oria_pro/common/symptoms/feature/pages/edit_my_symptoms_page.dart';

import '../../client/client_app_page.dart';
import '../../client/moduls/account/feature/pages/medical_info_page.dart';
import '../../client/moduls/account/feature/pages/update_my_info_page.dart';
import '../../client/moduls/expert/feature/entity/city.dart';
import '../../client/moduls/expert/feature/entity/expert.dart';
import '../../client/moduls/expert/feature/entity/province.dart';
import '../../client/moduls/expert/feature/entity/specialty.dart';
import '../../client/moduls/expert/feature/pages/appointments/entity/appointment.dart';
import '../../client/moduls/expert/feature/pages/appointments/entity/appointment_details.dart';
import '../../client/moduls/expert/feature/pages/appointments/pages/appointment_refunding_page.dart';
import '../../client/moduls/expert/feature/pages/appointments/pages/make_appointment_page.dart';
import '../../client/moduls/expert/feature/pages/appointments/pages/make_appointment_success.dart';
import '../../client/moduls/expert/feature/pages/appointments/pages/call_page.dart';
import '../../client/moduls/expert/feature/pages/appointments/pages/upcoming_details_page.dart';
import '../../client/moduls/expert/feature/pages/experts/pages/expert_details_page.dart';
import '../../client/moduls/expert/feature/pages/experts/pages/expert_filter_page.dart';
import '../../client/moduls/expert/feature/pages/experts/pages/find_specialist_page.dart';
import '../../client/moduls/explore/feature/learning/pages/article_page.dart';
import '../../client/moduls/explore/feature/programs/entity/symptom_program.dart';
import '../../client/moduls/explore/feature/programs/pages/program_details_page.dart';
import '../../client/moduls/explore/feature/programs/pages/program_sections_page.dart';
import '../../client/moduls/explore/feature/programs/pages/section_details_page.dart';
import '../../client/moduls/home/feature/symptoms_list_page.dart';
import '../../common/app_orchestrator/app_orchestrator.dart';
import '../../common/auth/feature/entity/onbaording_step.dart';
import '../../common/auth/feature/pages/create_account_page.dart';
import '../../common/auth/feature/pages/forgot_password_page.dart';
import '../../common/auth/feature/pages/login_page.dart';
import '../../common/onboarding/feature/cubit/onboarding_steps_cubit.dart';
import '../../common/onboarding/feature/pages/on_boarding_steps_page.dart';
import '../../common/email_verification/feature/verify_email_page.dart';
import '../../common/symptoms/feature/entity/symptom.dart';
import '../../common/symptoms/feature/pages/primary_symptom_programs_page.dart';
import '../../common/onboarding/feature/pages/profil_calculation_page.dart';
import '../../common/symptoms/feature/pages/primary_symptom_page.dart';
import '../../common/symptoms/feature/pages/secondary_symptoms_page.dart';
import '../../common/symptoms/feature/pages/symptom_data_page.dart';
import '../../common/symptoms/feature/pages/update_primary_symptom_page.dart';
import '../../common/symptoms/feature/pages/update_secondary_symptoms_page.dart';
import '../../common/symptoms/feature/pages/update_todays_action_page.dart';

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
    AutoRoute(page: SymptomDataRoute.page),
    AutoRoute(page: SymptomsListRoute.page),
    // Expert routes
    AutoRoute(page: FindSpecialistRoute.page),
    AutoRoute(page: ExpertFilterRoute.page),
    AutoRoute(page: ExpertDetailsRoute.page),
    AutoRoute(page: MakeAppointmentRoute.page),
    AutoRoute(page: MakeAppointmentSuccessRoute.page),
    AutoRoute(page: UpcomingDetailsRoute.page),
    AutoRoute(page: AppointmentRefundingRoute.page),
    // Account routes
    AutoRoute(page: UpdateMyInfoRoute.page),
    AutoRoute(page: MedicalInfoRoute.page),
    // Common routes
    AutoRoute(page: EditMySymptomsRoute.page),
    AutoRoute(page: UpdatePrimarySymptomRoute.page),
    AutoRoute(page: UpdateSecondarySymptomsRoute.page)
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
