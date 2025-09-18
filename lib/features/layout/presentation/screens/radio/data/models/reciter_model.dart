import 'package:json_annotation/json_annotation.dart';

import 'moshaf_model.dart';

part 'reciter_model.g.dart';
@JsonSerializable()
class Reciters {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "letter")
  final String? letter;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "moshaf")
  final List<Moshaf>? moshaf;

  Reciters ({
    this.id,
    this.name,
    this.letter,
    this.date,
    this.moshaf,
  });

  factory Reciters.fromJson(Map<String, dynamic> json) {
    return _$RecitersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecitersToJson(this);
  }
}