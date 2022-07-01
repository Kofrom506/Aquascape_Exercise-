class ScheduleModel {
  String id;
  DateTime startActive = DateTime.now();
  DateTime endActive = DateTime.now();
  double startIntensity;
  double endIntensity;

  ScheduleModel(
      {this.startIntensity = 50, this.endIntensity = 50, this.id = ''});
}
