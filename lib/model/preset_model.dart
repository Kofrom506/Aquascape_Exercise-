import 'package:aquascape_exercise/model/schedule_model.dart';

class PresetModel {
  String id;
  String presetName;
  List<ScheduleModel>? schedules;

  PresetModel(
      {this.id = '', this.presetName = 'Name', List<ScheduleModel>? schedules})
      : schedules = schedules ?? [ScheduleModel()];
}
