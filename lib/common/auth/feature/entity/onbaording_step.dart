import '../../../symptoms/feature/entity/symptom.dart';

class OnBoardingSteps {
  final String? name;
  final DateTime? birthDay;
  final List<Symptom> primarySymptoms;
  final List<Symptom> secondarySymptoms;
  final int stepsCount;
  final String? emailToVerify;

  const OnBoardingSteps({
    required this.name,
    required this.birthDay,
    required this.primarySymptoms,
    required this.secondarySymptoms,
    required this.stepsCount,
    required this.emailToVerify,
  });
}
