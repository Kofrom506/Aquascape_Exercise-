import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:hive/hive.dart';

class PresetService {
  late Box<PresetModel> _presets;

  Future<void> init() async {
    _presets = await Hive.openBox<PresetModel>('PresetTable');
  }

  List<PresetModel> fetchPresets() {
    return _presets.values.toList();
  }

  void addPreset(PresetModel preset) {
    _presets.add(preset);
  }

  Future<void> deletePreset(PresetModel preset) async {
    final presetToDelete =
        _presets.values.firstWhere((element) => element.id == preset.id);

    await presetToDelete.delete();
  }

  Future<void> updatePreset(PresetModel preset) async {
    final presetToEdit =
        _presets.values.firstWhere((element) => element.id == preset.id);

    final index = presetToEdit.key as int;
    await _presets.put(index, preset);
  }
}
