import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresetListCubit extends Cubit<List<PresetModel>> {
  PresetListCubit() : super([]);

  void addPreset(preset) {
    state.add(preset);
    emit(List.from(state));
  }

  void deletePreset(preset) {
    state.remove(preset);
    emit(List.from(state));
  }
}
