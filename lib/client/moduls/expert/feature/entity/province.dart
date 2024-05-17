class Province {
  final String id;
  final String name;

  const Province({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}
