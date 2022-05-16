
class Presets {
  static List<PresetViewDetail> listOfPresets=[PresetViewDetail("Preset1", DateTime.parse('1969-07-20 20:18:04Z'),  DateTime.parse('1969-07-20 20:18:04Z'), 50.0)];
  // static var listOfPresets=[];
  // Presets ({
  //   this.listOfPresets=[PresetViewDetail("Preset1", DateTime.parse('1969-07-20 20:18:04Z'),  DateTime.parse('1969-07-20 20:18:04Z'), 50.0)]
  // });
}

class PresetViewDetail {
  String? namePreset;
  DateTime? startActive;
  DateTime? endActive;
  double? intensity;

  PresetViewDetail(String namePreset, DateTime startActive, DateTime endActive,
      double intensity) {
    this.namePreset = namePreset;
    this.startActive = startActive;
    this.endActive = endActive;
    this.intensity = intensity;

    void printer(){
      print(namePreset);
      print(startActive);
      print(endActive);
      print(intensity);
    }
  }
}
