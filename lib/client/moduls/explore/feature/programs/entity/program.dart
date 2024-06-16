class Program {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final bool? finished;
  final bool? started;

  const Program({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    this.finished,
    this.started,
  });
}
