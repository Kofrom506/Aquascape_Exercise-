import 'package:aquascape_exercise/model/bluetooth_model.dart';
import 'package:aquascape_exercise/services/bluetooth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothCubit extends Cubit<BluetoothModel> {
  BluetoothCubit() : super(new BluetoothModel());
  late BluetoothService _bluetoothService;

  void init() async {
    _bluetoothService = BluetoothService();
    await _bluetoothService.init();
  }

  void fetchCurrentBluetooth() {
    BluetoothModel bluetooth = _bluetoothService.fetchCurrentBluetooth();
    emit(bluetooth);
  }

  void setCurrentBluetooth(BluetoothModel bluetooth) {
    _bluetoothService.setCurrentBluetooth(bluetooth);
    emit(bluetooth);
  }

  void deleteCurrentBluetooth() async {
    await _bluetoothService.deleteCurrentBluetooth();
    emit(new BluetoothModel());
  }
}
