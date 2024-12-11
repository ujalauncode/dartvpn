import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class VpnService {


static Future<void> requestPermissions() async {
  PermissionStatus status = await Permission.storage.request();

  if (status.isGranted) {
    debugPrint('Storage permission granted');
  } else if (status.isDenied) {
    debugPrint('Storage permission denied');

    openAppSettings();
  } else if (status.isPermanentlyDenied) {
    debugPrint('Storage permission permanently denied');
    openAppSettings();
  }
}

Future<void> getDocumentsDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  
  debugPrint('Documents directory: ${directory.path}');
    final file = File('${directory.path}/myFile.txt');
}



static Future<void> startVpn() async {
  try {
    await requestPermissions();

   var status = await Permission.storage.status;
    debugPrint("Storage permission status: $status");
    
    if (!status.isGranted) {
      debugPrint("Storage permission is still denied!");
      return;
    }
    
    debugPrint("Storage permission is granted!");
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      debugPrint('External storage directory not found');
      return;
    }

    final openvpnPath = '${directory.path}/openvpn';
    final ovpnPath = '${directory.path}/franceclient.ovpn';
    final credentialsPath = '${directory.path}/vpn_credentials.txt';

    if (!File(openvpnPath).existsSync()) {
      final openvpnAsset = await rootBundle.load('assets/vpn/openvpn');
      final openvpnFile = File(openvpnPath);
      await openvpnFile.writeAsBytes(openvpnAsset.buffer.asUint8List());

      final chmodResult = await Process.run('chmod', ['+x', openvpnFile.path]);
      debugPrint('chmod result: ${chmodResult.exitCode}');
    }

    if (!File(ovpnPath).existsSync()) {
      final ovpnAsset = await rootBundle.load('assets/vpn/franceclient.ovpn');
      final ovpnFile = File(ovpnPath);
      await ovpnFile.writeAsBytes(ovpnAsset.buffer.asUint8List());
    }

    if (!File(credentialsPath).existsSync()) {
      final credentialsFile = File(credentialsPath);
      await credentialsFile.writeAsString('openvpn\nOpenvppn@12');
    }

    final result = await Process.run(
      openvpnPath,
      ['--config', ovpnPath, '--auth-user-pass', credentialsPath],
    );

    if (result.exitCode == 0) {
      debugPrint('VPN started successfully!');
    } else {
      debugPrint('Error starting VPN: ${result.stderr}');
    }
  } catch (e) {
    debugPrint('Error starting VPN: $e');
  }
}

  static Future<void> stopVpn() async {
    try {
      final result = await Process.run('pkill', ['openvpn']);
      if (result.exitCode == 0) {
        debugPrint('VPN stopped successfully!');
      } else {
        debugPrint('Error stopping VPN: ${result.stderr}');
      }
    } catch (e) {
      debugPrint('Error stopping VPN: $e');
    }
  }
}
