import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/account/business/locator/account_locator.dart';
import 'package:oria_pro/client/moduls/account/business/model/medical_info_model.dart';
import 'package:oria_pro/client/moduls/account/business/repository/account_repository.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/medical_info.dart';

part 'medical_info_state.dart';

class MedicalInfoCubit extends Cubit<MedicalInfoState> {
  MedicalInfoCubit() : super(const MedicalInfoInitial());

  final AccountRepository _repository = AccountLocator().get();

  Future<void> getMedicalInfo() async {
    try {
      emit(MedicalInfoLoading(medicalInfo: state.medicalInfo));
      final medicalInfo = await _repository.getMedicalInfo();
      emit(MedicalInfoSuccess(medicalInfo: medicalInfo.toMedicalInfo()));
    } catch (e) {
      emit(MedicalInfoError(
          medicalInfo: state.medicalInfo, errorMessage: e.toString()));
    }
  }

  Future<void> addMedicalInfo(MedicalInfo medicalInfo) async {
    try {
      emit(SendMedicalInfoLoading(medicalInfo: state.medicalInfo));
      final response =
          await _repository.addMedicalInfo(medicalInfo.toMedicalInfoModel());
      emit(SendMedicalInfoSuccess(medicalInfo: response.toMedicalInfo()));
    } catch (e) {
      emit(MedicalInfoError(
          medicalInfo: state.medicalInfo, errorMessage: e.toString()));
    }
  }

  Future<void> updateMedicalInfo(MedicalInfo medicalInfo) async {
    try {
      emit(SendMedicalInfoLoading(medicalInfo: state.medicalInfo));
      final response =
          await _repository.updateMedicalInfo(medicalInfo.toMedicalInfoModel());
      emit(SendMedicalInfoSuccess(medicalInfo: response.toMedicalInfo()));
    } catch (e) {
      emit(MedicalInfoError(
          medicalInfo: state.medicalInfo, errorMessage: e.toString()));
    }
  }
}
