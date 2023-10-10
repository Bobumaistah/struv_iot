import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'hardware_model.g.dart';

@HiveType(typeId: 1)
class HardwareModel extends Equatable {
  @HiveField(0)
  final String? devOneID;

  @HiveField(1)
  final String? devTwoID;

  @HiveField(2)
  final String? type;

  const HardwareModel({this.devOneID, this.devTwoID, this.type});

  factory HardwareModel.fromJson(Map<String, dynamic> json) {
    return HardwareModel(
      devOneID: json['devOneID'].toString(),
      devTwoID: json['devTwoID'].toString(),
      type: json['type'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'devOneID': devOneID,
      'devTwoID': devTwoID,
      'type': type,
    };
  }

  @override
  List<Object?> get props => [
        devOneID,
        devTwoID,
        type,
      ];
}
