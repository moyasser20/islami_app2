class RadioEntity {
  final int id;
  final String name;
  final String? url;
  final DateTime? recentDate;

  const RadioEntity({
    required this.id,
    required this.name,
    this.url,
    this.recentDate,
  });
}
