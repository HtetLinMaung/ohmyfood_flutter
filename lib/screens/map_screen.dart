import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'MapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position.latitude);
    print(position.longitude);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          FutureBuilder<Position>(
            future: _getCurrentLocation(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return HereMap(
                  onMapCreated: (HereMapController hereMapController) =>
                      _onMapCreated(hereMapController, snapshot.data.latitude,
                          snapshot.data.longitude),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              margin: EdgeInsets.zero,
              child: Container(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(''),
                        ),
                        Expanded(
                          flex: 6,
                          child: MainButton(
                            onPressed: () {},
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
    );
  }

  void _onMapCreated(
      HereMapController hereMapController, double latitude, double longitude) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.greyDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      hereMapController.mapScene.addMapMarker(MapMarker(
          GeoCoordinates(latitude, longitude),
          MapImage.withFilePathAndWidthAndHeight(
              'images/marker.jpg', 120, 100)));

      const double distanceToEarthInMeters = 8000;
      // hereMapController.pinWidget(
      //     Icon(Icons.add), GeoCoordinates(latitude, longitude));
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(latitude, longitude), distanceToEarthInMeters);
    });
  }
}
