import 'dart:async';

import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/form/filled_input.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ohmyfood_flutter/screens/ordering_screen.dart';

var kMapImage =
    MapImage.withFilePathAndWidthAndHeight('images/marker.jpg', 120, 100);

class MapScreen extends StatefulWidget {
  static const routeName = 'MapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  double _latitude = 0;
  double _longitude = 0;
  TextEditingController _addressController = TextEditingController();
  TextEditingController _doorController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  HereMapController mapController;
  String _addressErrorText = '';
  String _doorErrorText = '';
  String _streetErrorText = '';
  Timer _timer;

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    _latitude = position.latitude;
    _longitude = position.longitude;
    return position;
  }

  @override
  Widget build(BuildContext context) {
    print('building');
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 15,
            ),
          ),
          title: Text(
            'Final Step',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: FutureBuilder<Position>(
                    future: _getCurrentLocation(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        print('future data');

                        return Stack(
                          children: [
                            HereMap(
                              onMapCreated:
                                  (HereMapController hereMapController) =>
                                      _onMapCreated(
                                          hereMapController,
                                          snapshot.data.latitude,
                                          snapshot.data.longitude),
                            ),
                            Positioned(
                              child: CircleButton(
                                onPress: () async {
                                  final position = await _getCurrentLocation();
                                  _latitude = position.latitude;
                                  _longitude = position.longitude;
                                  final deltaLatitude = position.latitude -
                                      mapController.camera.state
                                          .targetCoordinates.latitude;
                                  final deltaLongitude = position.longitude -
                                      mapController.camera.state
                                          .targetCoordinates.longitude;
                                  var latitude = mapController
                                      .camera.state.targetCoordinates.latitude;
                                  var longitude = mapController
                                      .camera.state.targetCoordinates.longitude;
                                  var count = 0;
                                  _timer = Timer.periodic(
                                      Duration(milliseconds: 5), (timer) {
                                    if (count == 60) {
                                      mapController.camera.lookAtPoint(
                                          GeoCoordinates(position.latitude,
                                              position.longitude));
                                      _timer.cancel();
                                    } else {
                                      if (deltaLatitude >= 0) {
                                        latitude += deltaLatitude.abs() / 60;
                                      } else {
                                        latitude -= deltaLatitude.abs() / 60;
                                      }

                                      if (deltaLongitude >= 0) {
                                        longitude += deltaLongitude.abs() / 60;
                                      } else {
                                        longitude -= deltaLongitude.abs() / 60;
                                      }

                                      mapController.camera.lookAtPoint(
                                          GeoCoordinates(latitude, longitude));
                                    }
                                    count++;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                ),
                              ),
                              bottom: 70,
                              right: 15,
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 195,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                ),
                margin: EdgeInsets.zero,
                child: Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: FilledInput(
                          controller: _addressController,
                          errorText: _addressErrorText,
                          onChanged: (text) {
                            setState(() {
                              _addressErrorText = '';
                              if (text.isEmpty) {
                                _addressErrorText =
                                    'Address must not be empty!';
                              }
                            });
                          },
                          hintText: 'Address',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: FilledInput(
                                controller: _doorController,
                                errorText: _doorErrorText,
                                onChanged: (text) {
                                  setState(() {
                                    _doorErrorText = '';
                                    if (text.isEmpty) {
                                      _doorErrorText =
                                          'Door No must not be empty!';
                                    }
                                  });
                                },
                                hintText: 'Door No',
                              ),
                            ),
                            Expanded(
                              child: Text(''),
                            ),
                            Expanded(
                              flex: 10,
                              child: FilledInput(
                                controller: _streetController,
                                errorText: _streetErrorText,
                                onChanged: (text) {
                                  setState(() {
                                    _streetErrorText = '';
                                    if (text.isEmpty) {
                                      _streetErrorText =
                                          'Address must not be empty!';
                                    }
                                  });
                                },
                                hintText: 'Street',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(''),
                          ),
                          Expanded(
                            flex: 6,
                            child: MainButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                    context, OrderingScreen.routeName);
                              },
                              title: 'Start Order',
                              color: kDarkYellowColor,
                            ),
                          ),
                          Expanded(
                            child: Text(''),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(
      HereMapController hereMapController, double latitude, double longitude) {
    mapController = hereMapController;
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.greyDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }
      var marker = MapMarker(GeoCoordinates(latitude, longitude), kMapImage);
      hereMapController.mapScene.addMapMarker(marker);
      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(latitude, longitude), distanceToEarthInMeters);

      hereMapController.camera.zoomTo(16);
      hereMapController.camera.addObserver(CustomObserver(
        controller: hereMapController,
        marker: marker,
        onCameraChanged: (cameraState) {
          _latitude = cameraState.targetCoordinates.latitude;
          _longitude = cameraState.targetCoordinates.longitude;
        },
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}

class CustomObserver extends MapCameraObserver {
  final HereMapController controller;
  MapMarker marker;
  final void Function(MapCameraState cameraState) onCameraChanged;

  CustomObserver({
    this.controller,
    this.marker,
    this.onCameraChanged,
  });

  @override
  onCameraUpdated(MapCameraState cameraState) {
    controller.mapScene.removeMapMarker(marker);
    marker = MapMarker(
        GeoCoordinates(cameraState.targetCoordinates.latitude,
            cameraState.targetCoordinates.longitude),
        kMapImage);
    controller.mapScene.addMapMarker(marker);
    onCameraChanged(cameraState);
  }
}
