import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../constants/assets.dart';

class DemoAccelometerScreen extends StatefulWidget {
  const DemoAccelometerScreen({Key? key}) : super(key: key);

  @override
  _DemoAccelometerScreenState createState() => _DemoAccelometerScreenState();
}

class _DemoAccelometerScreenState extends State<DemoAccelometerScreen> {
  late List<double> _accelerometerValues;

  double xIc1 = -25.0;
  double xIc2 = 0.0;
  double xIc3 = -10.0;
  double scale = 1920 / 1080;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      _accelerometerValues = <double>[event.x, event.y, event.z];
      print('${event.x}');
      if ((_accelerometerValues[0] < 0)) {
        setState(() {
          xIc1 = xIc1 < 0 ? xIc1 + .5 : 0.0;
          xIc2 = xIc2 > -50 ? xIc2 - .8 : -50;
          xIc3 = xIc3 > -50 ? xIc3 - 1.2 : -50;
        });
      } else {
        setState(() {
          xIc1 = xIc1 > -50 ? xIc1 - .5 : -50;
          xIc2 = xIc2 < 0 ? xIc2 + .8 : 0.0;
          xIc3 = xIc3 < 0 ? xIc3 + 1.2 : 0.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              parallax(),
              info(),
            ],
          )),
    );
  }

  Widget info() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'FLUTTER',
          style: TextStyle(
            color: Colors.blue,
            letterSpacing: 6,
            fontSize: 50,
            fontFamily: 'arcadeclassic',
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'DEMO',
              style: TextStyle(
                color: Colors.green,
                letterSpacing: 6,
                fontSize: 30,
                fontFamily: 'arcadeclassic',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' Accelerometer',
              style: TextStyle(
                color: Colors.green,
                letterSpacing: 2,
                fontSize: 14,
                fontFamily: 'arcadeclassic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(
          height: 50,
          color: Colors.transparent,
        ),
        const Text(
          'font : arcadeclassic',
          style: TextStyle(
            color: Colors.lightBlue,
            letterSpacing: 1,
            fontSize: 14,
            fontFamily: 'arcadeclassic',
            fontWeight: FontWeight.normal,
          ),
        ),
        const Text(
          'image : opengameart.org',
          style: TextStyle(
            color: Colors.lightBlue,
            letterSpacing: 1,
            fontSize: 14,
            fontFamily: 'arcadeclassic',
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ));
  }

  Widget parallax() {
    return Stack(
      children: <Widget>[
        Positioned(
            left: xIc1,
            bottom: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width + 250,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.accelometerBGLayer01))),
            )),
        Positioned(
            left: xIc2,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width + 250,
              height: (MediaQuery.of(context).size.width + 250) / scale,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(ImageAssets.accelometerBGLayer02))),
            )),
        Positioned(
            left: xIc3,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width + 100,
              height: (MediaQuery.of(context).size.width + 100) / scale,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.accelometerBGLayer03))),
            )),
        Positioned(
            left: xIc2,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width + 100,
              height: (MediaQuery.of(context).size.width + 100) / scale,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.accelometerBGLayer04))),
            )),
        Positioned(
            left: xIc1,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width + 100,
              height: (MediaQuery.of(context).size.width + 100) / scale,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.accelometerBGLayer05))),
            )),
      ],
    );
  }
}
