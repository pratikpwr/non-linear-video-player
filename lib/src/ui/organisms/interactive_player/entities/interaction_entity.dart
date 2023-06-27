class InteractionEntity {
  final String videoUrl;
  final String title;
  final String? question;
  final List<InteractionEntity> options;

  const InteractionEntity({
    required this.videoUrl,
    required this.title,
    required this.question,
    required this.options,
  });

  bool get isLast => options.isEmpty;
}
