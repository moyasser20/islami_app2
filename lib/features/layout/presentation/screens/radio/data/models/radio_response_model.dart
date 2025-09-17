import 'package:islami_app2/features/layout/presentation/screens/radio/data/models/radio_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'radio_response_model.g.dart';

@JsonSerializable()
class RadioResponseModel {
  @JsonKey(name: "radios")
  final List<Radios>? radios;

  RadioResponseModel ({
    this.radios,
  });

  factory RadioResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RadioResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadioResponseModelToJson(this);
  }
}




