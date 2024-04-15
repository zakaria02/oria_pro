class City {
  final String name;
  final String province;
  final String id;

  const City({
    required this.name,
    required this.province,
    required this.id,
  });

  @override
  String toString() {
    return name;
  }
}
