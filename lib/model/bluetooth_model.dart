import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class BluetoothModel extends HiveObject {
  @HiveField(0)
  String bluetoothId;

  BluetoothModel({this.bluetoothId = ''});
}
