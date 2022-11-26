import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/widgets/aqualed_app_bar.dart';
import 'package:aquascape_exercise/ui/widgets/aqualed_app_bar_exit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import './BluetoothDeviceListEntry.dart';

class DiscoveryPage extends StatefulWidget {
  /// If true, discovery starts on page start, otherwise user must press action button.
  final bool start;
  const DiscoveryPage({this.start = true});

  @override
  _DiscoveryPage createState() => new _DiscoveryPage();
}

class _DiscoveryPage extends State<DiscoveryPage> {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isDiscovering = false;
  bool isBonding = false;

  _DiscoveryPage();

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.start;
    if (isDiscovering) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        final existingIndex = results.indexWhere(
            (element) => element.device.address == r.device.address);
        if (existingIndex >= 0)
          results[existingIndex] = r;
        else
          results.add(r);
      });
    });

    _streamSubscription!.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  // @TODO . One day there should be `_pairDevice` on long tap on something... ;)

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and cancel discovery
    _streamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isBonding
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Scaffold(
              backgroundColor: cBlackColor,
              appBar: AqualedAppBarExit(),
              body: Container(
                margin: EdgeInsets.all(defaultMargin),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Available Devices',
                              style: WhiteFont.copyWith(
                                  fontSize: 22, fontWeight: bold),
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            color: cWhiteColor,
                            icon: Icon(Icons.restart_alt),
                            onPressed: _restartDiscovery,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    isDiscovering
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: Container(
                              child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 17,
                                  );
                                },
                                itemCount: results.length,
                                itemBuilder: (BuildContext context, index) {
                                  BluetoothDiscoveryResult result =
                                      results[index];
                                  final device = result.device;
                                  final address = device.address;
                                  return BluetoothDeviceListEntry(
                                    device: device,
                                    rssi: result.rssi,
                                    onTap: () {
                                      Navigator.of(context).pop(result.device);
                                    },
                                    //bonding address when long press
                                    onLongPress: () async {
                                      try {
                                        bool bonded = false;
                                        print(device.bondState
                                            .toString()
                                            .toUpperCase());
                                        if (device.isBonded) {
                                          print(
                                              'Unbonding from ${device.address}...');
                                          await FlutterBluetoothSerial.instance
                                              .removeDeviceBondWithAddress(
                                                  address);
                                          print(
                                              'Unbonding from ${device.address} has succed');
                                        } else {
                                          print(
                                              'Bonding with ${device.address}...');
                                          setState(() {
                                            isBonding = true;
                                          });

                                          bonded = (await FlutterBluetoothSerial
                                              .instance
                                              .bondDeviceAtAddress(address))!;
                                          print(
                                              'Bonding with ${device.address} has ${bonded ? 'succed' : 'failed'}.');
                                          isBonding = false;
                                        }
                                        setState(() {
                                          results[results.indexOf(result)] =
                                              BluetoothDiscoveryResult(
                                                  device: BluetoothDevice(
                                                    name: device.name ??
                                                        'Unknown Devices',
                                                    address: address,
                                                    type: device.type,
                                                    bondState: bonded
                                                        ? BluetoothBondState
                                                            .bonded
                                                        : BluetoothBondState
                                                            .none,
                                                  ),
                                                  rssi: result.rssi);
                                        });
                                      } catch (ex) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Error occured while bonding'),
                                              content: Text("${ex.toString()}"),
                                              actions: <Widget>[
                                                new TextButton(
                                                  child: new Text("Close"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
