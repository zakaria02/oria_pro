part of 'medical_info_cubit.dart';

abstract class MedicalInfoState extends Equatable {
  final MedicalInfo? medicalInfo;

  const MedicalInfoState({required this.medicalInfo});

  @override
  List<Object?> get props => [medicalInfo];
}

final class MedicalInfoInitial extends MedicalInfoState {
  const MedicalInfoInitial() : super(medicalInfo: null);
}

final class MedicalInfoLoading extends MedicalInfoState {
  const MedicalInfoLoading({required super.medicalInfo});
}

final class SendMedicalInfoLoading extends MedicalInfoState {
  const SendMedicalInfoLoading({required super.medicalInfo});
}

final class SendMedicalInfoSuccess extends MedicalInfoState {
  const SendMedicalInfoSuccess({required super.medicalInfo});
}

final class MedicalInfoSuccess extends MedicalInfoState {
  const MedicalInfoSuccess({required super.medicalInfo});
}

final class MedicalInfoError extends MedicalInfoState {
  final String errorMessage;
  const MedicalInfoError({
    required super.medicalInfo,
    required this.errorMessage,
  });
}
