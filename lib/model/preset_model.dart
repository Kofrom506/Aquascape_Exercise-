import 'package:aquascape_exercise/model/schedule_model.dart';
import 'package:hive/hive.dart';
part 'preset_model.g.dart';

@HiveType(typeId: 1)
class PresetModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String presetName;
  @HiveField(2)
  List<ScheduleModel>? schedules;

  PresetModel(
      {required this.id,
      this.presetName = 'Name',
      List<ScheduleModel>? schedules})
      : schedules = schedules ?? [ScheduleModel()];

  List<ScheduleModel> getSchedule() {
    return schedules!;
  }

  static PresetModel copyWith(PresetModel presetModel) {
    List<ScheduleModel> newList = [...presetModel.schedules!];

    return PresetModel(
        id: '', presetName: presetModel.presetName, schedules: newList);
  }
}
