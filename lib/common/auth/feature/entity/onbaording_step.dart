import '../../../symptoms/feature/entity/symptom.dart';

class OnBoardingSteps {
  final String? name;
  final DateTime? birthDay;
  final List<Symptom> primarySymptoms;
  final int stepsCount;
  final String? emailToVerify;

  const OnBoardingSteps({
    required this.name,
    required this.birthDay,
    required this.primarySymptoms,
    required this.stepsCount,
    required this.emailToVerify,
  });
}
