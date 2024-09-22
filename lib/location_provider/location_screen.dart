import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/location_provider/location_name_provider.dart';
import 'package:test/location_provider/location_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<LocationNameProvider>(context);
    final stateProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                stateProvider.getLocation();
              },
              child: const Text("Get Loaction")),
          Consumer<LocationProvider>(builder: (context, state, _) {
            return InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  homeState.getLocationName(
                    stateProvider.latitude,
                    stateProvider.longitude,
                  );
                });
              },
              child: Column(
                children: [
                  Text(state.latitude.toString() ?? ""),
                  Text(state.latitude.toString() ?? ""),
                  Text(state.currentLocation.toString() ?? ""),
                  Text(homeState.locationName.toString() ?? ""),
                ],
              ),
            );
          })
        ],
      ),
      // body: const GoogleMap(
      //   mapType: MapType.satellite,
      //     initialCameraPosition: CameraPosition(
      //   target: LatLng(88.077179, 26.570024),
      //   zoom: 14,
      // )),
    );
  }
}
