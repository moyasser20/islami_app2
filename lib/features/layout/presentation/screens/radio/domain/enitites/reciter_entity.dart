import 'moshaf_enitity.dart';

class ReciterEntity {
  final int id;
  final String name;
  final String? letter;
  final DateTime? date;
  final List<MoshafEntity> moshaf;

  const ReciterEntity({
    required this.id,
    required this.name,
    this.letter,
    this.date,
    required this.moshaf,
  });
}