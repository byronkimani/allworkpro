import 'dart:async';

import 'package:allworkpro/business_logic/helpers.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/infrastructure/api_calls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage();

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  double bottomPaddingOfMap = 0;
  Position? currentPosition;
  Geolocator geolocator = Geolocator();
  GoogleMapController? newGoogleMapController;
  bool onlineStatus = false;
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  // ignore: cancel_subscriptions
  StreamSubscription<Position>? homeTabPageStreamSubscription;

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-1.181056, 36.927234),
    zoom: 15.4746,
  );

  final Completer<GoogleMapController> _controllerGoogleMaps =
      Completer<GoogleMapController>();

  Future<void> locatePosition() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.always ||
        permission != LocationPermission.whileInUse) {
      final LocationPermission requestPermission =
          await Geolocator.requestPermission();

      if (!(requestPermission != LocationPermission.always ||
          requestPermission != LocationPermission.whileInUse)) {
        await Geolocator.openLocationSettings();
      }
    }
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    final LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    final CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    // final String address =
    //     await searchCoordinateAddress(position: position, context: context);
  }

  Future<void> makeProviderOnline() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    const String pathToReference = 'availableProviders';
    Geofire.initialize(pathToReference);
    Geofire.setLocation(
      userId,
      currentPosition!.latitude,
      currentPosition!.longitude,
    );
    serviceRequestRef!.onValue.listen((DatabaseEvent event) {});
  }

  void getLocationLiveUpdates() {
    homeTabPageStreamSubscription = Geolocator.getPositionStream().listen(
      (Position position) {
        currentPosition = position;
        if (onlineStatus == true) {
          Geofire.setLocation(userId, position.latitude, position.longitude);
        }
        final LatLng latLng = LatLng(position.latitude, position.longitude);
        newGoogleMapController!.animateCamera(CameraUpdate.newLatLng(latLng));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeTabPageStreamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
          myLocationEnabled: true,
          initialCameraPosition: _cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controllerGoogleMaps.complete(controller);
            newGoogleMapController = controller;
            locatePosition();
          },
        ),

        // online offline container
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            color: whiteColor,
            height: 50,
            width: 150,
            child: Row(
              children: <Widget>[
                Switch(
                  value: onlineStatus,
                  onChanged: (bool v) async {
                    if (v == true) {
                      await makeProviderOnline();
                      getLocationLiveUpdates();
                      displaytoastMessage(message: 'You are online now');
                    } else {
                      await Geofire.removeLocation(userId);
                      serviceRequestRef!.onDisconnect();
                      serviceRequestRef!.remove();
                      serviceRequestRef!.set(null);

                      displaytoastMessage(message: 'You are offline now');
                    }

                    setState(() {
                      onlineStatus = v;
                    });
                  },
                ),
                Text(
                  onlineStatus ? 'Online' : 'Offline',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: onlineStatus ? accentColor : Colors.grey,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
