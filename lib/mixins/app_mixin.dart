import 'package:huawei_location/location/fused_location_provider_client.dart';
import 'package:huawei_location/location/location.dart';
import 'package:huawei_location/location/location_request.dart';
import 'package:huawei_location/permission/permission_handler.dart';

mixin AppMixin {
  Future<Location?> getLocation() async {
    PermissionHandler permissionHandler = PermissionHandler();

    try {
      final bool status = await permissionHandler.requestLocationPermission();
      if (status) {
        FusedLocationProviderClient locationService = FusedLocationProviderClient();

        await locationService.requestLocationUpdates(LocationRequest()..interval = 500);
        return await locationService.getLastLocation();
      }
    } catch (e) {
      return null;
    }
  }
}
