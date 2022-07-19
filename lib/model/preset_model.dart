import 'package:aquascape_exercise/model/schedule_model.dart';

class PresetModel {
  String id;
  String presetName;
  List<ScheduleModel>? schedules;

  PresetModel(
      {required this.id,
      this.presetName = 'Name',
      List<ScheduleModel>? schedules})
      : schedules = schedules ?? [ScheduleModel()];

  List<ScheduleModel> getSchedule() {
    return schedules!;
  }
}
