import 'package:flutter/material.dart';
import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceListEntry extends ListTile {
  BluetoothDeviceListEntry({
    required BluetoothDevice device,
    int? rssi,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    bool enabled = true,
  }) : super(
          onTap: onTap,
          selectedColor: cWhiteColor,
          onLongPress: onLongPress,
          enabled: enabled,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          tileColor: cDarkGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          title: Text(device.name ?? "",
              style: WhiteFont.copyWith(
                  fontSize: 21, fontWeight: bold, letterSpacing: 0.35)),
          subtitle: Text(device.address.toString(),
              style: greyFont.copyWith(
                  fontSize: 18, fontWeight: medium, letterSpacing: 0.35)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              rssi != null
                  ? Container(
                      margin: new EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.signal_cellular_alt,
                        color: _computeColor(rssi),
                      ),
                    )
                  : Container(width: 0, height: 0),
              device.isConnected
                  ? Icon(Icons.import_export)
                  : Container(width: 0, height: 0),
              device.isBonded
                  ? Icon(Icons.link)
                  : Container(width: 0, height: 0),
            ],
          ),
        );

  static Color? _computeColor(int rssi) {
    /**/ if (rssi >= -35)
      return Colors.greenAccent[700];
    else if (rssi >= -45)
      return Colors.lightGreen;
    else if (rssi >= -55)
      return Colors.lime[600];
    else if (rssi >= -65)
      return Colors.amber;
    else if (rssi >= -75)
      return Colors.deepOrangeAccent;
    else if (rssi >= -85)
      Colors.redAccent;
    else
      /*code symmetry*/
      return Colors.redAccent;
  }
}
