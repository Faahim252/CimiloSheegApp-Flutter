import 'package:cimilo_sheeg/Screans/Search.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cimilo_sheeg/widgets/weatherView.dart';
import 'package:cimilo_sheeg/widgets/welcomeView.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  WeatherFactory OpenWeather =
      WeatherFactory('972838bb61a9e70b52b5c25d9593cca6');
  Weather? weather;
  bool isLoding = false;
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true);
    return position;
  }

  Future<void> getweather() async {
    setState(() => isLoding = !isLoding);
    Position Location = await getLocation();
    weather = await OpenWeather.currentWeatherByLocation(
        Location.latitude, Location.longitude);
    setState(() => isLoding = !isLoding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (() {
              getweather();
            }),
            icon: Icon(Icons.pin_drop_outlined),
          ),
          IconButton(
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScrean(),
                  ));
            }),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/elite.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken)),
          ),
          child:
              weather == null ? WelcomeView() : WeatherView(weather: weather!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('CimiloSheeg App'),
                  content: Text(
                    'CimiloSheeg waa Application loogu talagalay in uu kusoo sheego Cimilada meelweliba aad joogto',
                  ),
                  actions: [
                    TextButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        child: Text('Ok, cancel'))
                  ],
                );
              });
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}
