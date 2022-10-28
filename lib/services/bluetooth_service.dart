import 'package:hive/hive.dart';

import '../model/bluetooth_model.dart';

class BluetoothService {
  late Box<BluetoothModel> _bluetooth;

  Future<void> init() async {
    _bluetooth = await Hive.openBox('BluetoothTable');
  }

  void setCurrentBluetooth(BluetoothModel bluetooth) {
    _bluetooth.put(0, bluetooth);
  }

  BluetoothModel fetchCurrentBluetooth() {
    if (_bluetooth.isEmpty) setCurrentBluetooth(new BluetoothModel());
    return _bluetooth.values.elementAt(0);
  }

  Future<void> deleteCurrentBluetooth() async {
    await _bluetooth.deleteAt(0);
  }
}
