import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfo extends StatefulWidget {
  final WeatherModel weatherModel;

  const WeatherInfo({super.key, required this.weatherModel});

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  bool _isCardRowVisible =
      false; // State to track the visibility of the card row

  void _toggleCardRowVisibility() {
    setState(() {
      _isCardRowVisible = !_isCardRowVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1B2445),
            Color(0xff292D5C),
            Color(0xff433A8B),
            Color(0xff5C42A5),
            Color(0xff6A4AAA),
            Color(0xff874EAC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5),
                child: Row(children: [
                  buildCard('32°', 'Assets/images/hot.png', 'Tues'),
                  const SizedBox(width: 10),
                  buildCard('36°', 'Assets/images/hot.png', 'Wed'),
                  const SizedBox(width: 10),
                  buildCard('38°', 'Assets/images/hot.png', 'Thurs'),
                  const SizedBox(width: 10),
                  buildCard('40°', 'Assets/images/hot.png', 'Fri'),
                  const SizedBox(width: 10),
                  buildCard('37°', 'Assets/images/hot.png', 'Sat'),
                  const SizedBox(width: 10),
                  buildCard('40°', 'Assets/images/hot.png', 'Sun'),
                  const SizedBox(width: 10),
                  buildCard('34°', 'Assets/images/hot.png', 'Mon'),
                  const SizedBox(width: 10),
                ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              widget.weatherModel.cityName ?? 'City name not available',
              style: const TextStyle(
                  fontSize: 44,
                  color: Colors.amber,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Zilla Slab'),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 175.0),
              child: Row(
                children: [
                  Text(
                    '${widget.weatherModel.temp.round()}',
                    style: const TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontFamily: 'Nerko_One'),
                  ),
                  const Text(
                    '°',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    'Max Temp : ${widget.weatherModel.maxTemp.round()}',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Zilla Slab'),
                  ),
                  const Text(
                    '°',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Min Temp : ${widget.weatherModel.minTemp.round()}',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Zilla Slab'),
                  ),
                  const Text(
                    '°',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Chance of rain : ${widget.weatherModel.chanceOfRain?.round() ?? 0} %',
              style: const TextStyle(
                  fontSize: 24, color: Colors.white, fontFamily: 'Zilla Slab'),
            ),
            Text(
              'Chance of snow : ${widget.weatherModel.chanceOfSnow?.round() ?? 0} %',
              style: const TextStyle(
                  fontSize: 24, color: Colors.white, fontFamily: 'Zilla Slab'),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.weatherModel.weatherCondition,
                  style: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontFamily: 'Zilla Slab'),
                ),
                const SizedBox(
                  width: 25,
                ),
                widget.weatherModel.image != null
                    ? Image.asset(
                        widget.weatherModel.image!,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Image not found');
                        },
                      )
                    : const Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 50,
                      ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Updated at ${widget.weatherModel.date.hour}:${widget.weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 252, 190, 4),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String text1, String imagePath, String text2) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff292D5C),
              Color(0xff5C42A5),
              Color(0xff433A8B),
              Color(0xff5C42A5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: 140,
        height: 160, // Height greater than width
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                'Assets/images/sun.png',
                width: 70,
                height: 61,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Image not found');
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                text2,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Zilla Slab',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
