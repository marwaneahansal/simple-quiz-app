import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:quiz_app/schemas/connectivity_status.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Online;
        break;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.Online;
        break;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
        break;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
