import 'package:flutter/material.dart';

import 'package:huawei_location/location/location.dart' as loc;
import 'package:huawei_map/map.dart';
import 'package:new_app/mixins/app_mixin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AppMixin {
  loc.Location? location;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      location = await getLocation();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('lat ${location?.latitude}\nlong ${location?.longitude}'),
          Center(
            child: SizedBox(
              height: 350.0,
              child: HuaweiMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    location?.latitude ?? 50.47631226088768,
                    location?.longitude ?? 30.459554929067455,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
