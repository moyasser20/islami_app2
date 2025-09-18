
import 'package:json_annotation/json_annotation.dart';

part 'moshaf_model.g.dart';
@JsonSerializable()
class Moshaf {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "server")
  final String? server;
  @JsonKey(name: "surah_total")
  final int? surahTotal;
  @JsonKey(name: "moshaf_type")
  final int? moshafType;
  @JsonKey(name: "surah_list")
  final String? surahList;

  Moshaf ({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return _$MoshafFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MoshafToJson(this);
  }
}