import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/services/preset_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresetListCubit extends Cubit<List<PresetModel>> {
  PresetListCubit() : super([]);
  late PresetService _presetService;

  // void init() async {
  //   await _presetService.init();
  // }

  void fetchPresets() async {
    _presetService = PresetService();
    List<PresetModel> presetList = await _presetService.fetchPresets();
    // if (presetList == null) emit([]);
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
