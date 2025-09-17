import 'package:islami_app2/features/layout/presentation/screens/radio/data/models/reciter_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reciter_response_model.g.dart';

@JsonSerializable()
class ReciterResponseModel {
  @JsonKey(name: "reciters")
  final List<Reciters>? reciters;

  ReciterResponseModel ({
    this.reciters,
  });

  factory ReciterResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ReciterResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReciterResponseModelToJson(this);
  }
}





