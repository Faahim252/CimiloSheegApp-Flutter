import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';
import 'package:cimilo_sheeg/widgets/weatherView.dart';

class SearchScrean extends StatefulWidget {
  const SearchScrean({Key? key}) : super(key: key);

  @override
  State<SearchScrean> createState() => _SearchScreanState();
}

class _SearchScreanState extends State<SearchScrean> {
  String CityName = '';
  WeatherFactory OpenWeather =
      WeatherFactory('972838bb61a9e70b52b5c25d9593cca6');
  Weather? weather;
  bool isLoding = false;

  Future<void> getweather() async {
    setState(() => isLoding = !isLoding);
    try {
      weather = await OpenWeather.currentWeatherByCityName(CityName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
          duration: Duration(seconds: 7),
        ),
      );
    }
    setState(() => isLoding = !isLoding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'search',
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onChanged: (value) {
                //   CityName = value;
                //   getweather();
                // },
                onSubmitted: ((value) {
                  CityName = value;
                  getweather();
                }),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Country or City Name. ',
                ),
              ),
            ),
            Expanded(
              child: weather == null
                  ? Container()
                  : WeatherView(
                      weather: weather!,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
