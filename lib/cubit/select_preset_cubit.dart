import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPresetCubit extends Cubit<String> {
  SelectPresetCubit() : super('sdskusgfuk');

  void selectPreset(String id) {
    if (!isSelected(id))
      emit(id);
    else {
      emit('');
    }
  }

  bool isSelected(String id) {
    if (state == id)
      return true;
    else
      return false;
  }
}
