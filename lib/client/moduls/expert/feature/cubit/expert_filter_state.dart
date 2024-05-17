part of 'expert_filter_cubit.dart';

class ExpertFilterState extends Equatable {
  const ExpertFilterState({
    required this.specialty,
    required this.cities,
    required this.city,
    required this.rating,
    required this.provinces,
    required this.province,
  });
  final Specialty? specialty;
  final City? city;
  final int? rating;
  final List<City> cities;
  final List<Province> provinces;
  final Province? province;

  @override
  List<Object?> get props =>
      [specialty, cities, city, rating, provinces, province];
}
