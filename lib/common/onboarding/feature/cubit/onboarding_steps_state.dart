part of 'onboarding_steps_cubit.dart';

class OnboardingStepsState extends Equatable {
  const OnboardingStepsState({
    this.name,
    this.birthDay,
    this.primarySymptom,
    this.primarySymptomSeverity = -1,
    this.secondarySymptoms = const [],
    this.symptomProgram,
    required this.currentIndex,
    required this.progress,
    required this.maxIndex,
  });
  final String? name;
  final DateTime? birthDay;
  final SymptomInfo? primarySymptom;
  final int primarySymptomSeverity;
  final Program? symptomProgram;
  final List<SymptomInfo> secondarySymptoms;
  final int currentIndex;
  final double progress;
  final int maxIndex;

  @override
  List<Object?> get props => [
        name,
        birthDay,
        primarySymptom,
        primarySymptomSeverity,
        symptomProgram,
        name,
        secondarySymptoms,
        currentIndex,
        progress,
      ];
}
