import 'package:hive/hive.dart';
part 'bluetooth_model.g.dart';

@HiveType(typeId: 2)
class BluetoothModel extends HiveObject {
  @HiveField(0)
  String bluetoothId;

  BluetoothModel({this.bluetoothId = ''});
}
