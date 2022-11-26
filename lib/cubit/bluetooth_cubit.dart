import 'package:aquascape_exercise/model/bluetooth_model.dart';
import 'package:aquascape_exercise/services/bluetooth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothCubit extends Cubit<BluetoothModel> {
  BluetoothCubit() : super(new BluetoothModel());
  late BluetoothService _bluetoothService;
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isConnectedAlready = false;

  void init() async {
    _bluetoothService = BluetoothService();
    await _bluetoothService.init();
    fetchCurrentBluetooth();
    _startDiscovery();
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

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      final existingIndex = results
          .indexWhere((element) => element.device.address == r.device.address);
      if (r.device.isConnected) {
        isConnectedAlready = true;
        if (state.bluetoothId != r.device.address) {
          setCurrentBluetooth(
              new BluetoothModel(bluetoothId: r.device.address));
        }
      }
      if (existingIndex >= 0)
        results[existingIndex] = r;
      else
        results.add(r);
    });

    _streamSubscription!.onDone(() {
      isConnected();
    });
  }

  void isConnected() {
    for (BluetoothDiscoveryResult result in results) {
      if (result.device.isConnected) isConnectedAlready = true;
    }
    isConnectedAlready = false;
  }
}
