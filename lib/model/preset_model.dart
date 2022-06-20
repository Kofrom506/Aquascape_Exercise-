class PresetModel {
  final String presetId;
  String presetName;

  PresetModel({required this.presetId, this.presetName = 'Name'});
}

class ScheduleModel extends PresetModel {
  final String scheduleId;
  DateTime startActive = DateTime.now();
  DateTime endActive = DateTime.now();
  double intensity;

  ScheduleModel(String presetId,
      {required this.scheduleId, this.intensity = 50})
      : super(presetId: presetId);
}
