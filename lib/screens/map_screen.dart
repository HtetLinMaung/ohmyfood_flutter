import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'MapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
          HereMap(onMapCreated: _onMapCreated),
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

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);
    });
  }
}
