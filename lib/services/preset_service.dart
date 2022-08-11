import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/model/schedule_model.dart';
import 'package:hive/hive.dart';

class PresetService {
  late Box<PresetModel> _presets;

  // Future<void> init() async {
  //   _presets = await Hive.openBox<PresetModel>('PresetTable');
  //   // _presets.add(PresetModel(id: 'podaodao'));
  //   // _presets.add(PresetModel(id: 'asaascd'));
  //   // if (_presets.isEmpty) {
  //   //   _presets.add(PresetModel(id: 'asaascd'));
  //   // }
  // }

  Future<List<PresetModel>> fetchPresets() async {
    _presets = await Hive.openBox<PresetModel>('PresetTable');
    // await _presets.clear();
    // _presets.add(PresetModel(id: 'podaodao'));
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
