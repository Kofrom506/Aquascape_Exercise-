import 'package:hive/hive.dart';
part 'schedule_model.g.dart';

@HiveType(typeId: 0)
class ScheduleModel extends HiveObject {
  @HiveField(0)
  DateTime startActive = DateTime.now();
  @HiveField(1)
  DateTime endActive = DateTime.now();
  @HiveField(2)
  double startIntensity;
  @HiveField(3)
  double endIntensity;

  ScheduleModel({this.startIntensity = 50, this.endIntensity = 50});
}
