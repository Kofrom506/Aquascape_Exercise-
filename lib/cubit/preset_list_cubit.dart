import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/services/preset_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresetListCubit extends Cubit<List<PresetModel>> {
  PresetListCubit() : super([]);
  late PresetService _presetService;

  void init() async {
    _presetService = PresetService();
    await _presetService.init();
    fetchPresets();
  }

  void fetchPresets() {
    List<PresetModel> presetList = _presetService.fetchPresets();
    emit(presetList);
  }

  void addPreset(preset) {
    state.add(preset);
    _presetService.addPreset(preset);
    emit(List.from(state));
  }

  void deletePreset(preset) {
    state.remove(preset);
    emit(List.from(state));
  }
}
