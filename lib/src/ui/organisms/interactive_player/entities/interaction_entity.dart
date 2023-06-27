class InteractiveEntity {
  final String videoUrl;
  final String title;
  final String? question;
  final List<InteractiveEntity> options;

  const InteractiveEntity({
    required this.videoUrl,
    required this.title,
    required this.question,
    required this.options,
  });

  bool get isLast => options.isEmpty;
}
