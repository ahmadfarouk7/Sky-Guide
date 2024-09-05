import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Screens/Search_View.dart';
import 'package:weatherapp/Widgets/Gradient_AppBar.dart';
import 'package:weatherapp/Widgets/No_weather.dart';
import 'package:weatherapp/Widgets/Weather_Info.dart';
import 'package:weatherapp/cubits/Get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/Get_weather_cubit/get_weather_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GradientAppBar(
        title1: 'Sky',
        title2: 'Guide',
        gradientColors: const [
          Color(0xff1B2445),
          Color(0xff292D5C),
          Color(0xff433A8B),
          Color(0xff5C42A5),
          Color(0xff6A4AAA),
          Color(0xff874EAC),
        ],
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            return WeatherInfo(weatherModel: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text('Failed to load weather information'),
            );
          } else if (state is NoWeatherState) {
            return const NoWeather();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
