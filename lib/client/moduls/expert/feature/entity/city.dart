class City {
  final String name;
  final String provinceId;
  final String provinceName;
  final String id;

  const City({
    required this.name,
    required this.provinceId,
    required this.provinceName,
    required this.id,
  });

  @override
  String toString() {
    return name;
  }
}
