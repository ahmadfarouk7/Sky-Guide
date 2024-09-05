import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Screens/Home_View.dart';
import 'package:weatherapp/Screens/Splash_screen.dart';
import 'package:weatherapp/cubits/Get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/Get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          ThemeData theme;
          if (state is WeatherLoadedState) {
            theme = ThemeData(
              primaryColor: getThemeColor(state.weatherModel.weatherCondition),
              appBarTheme: AppBarTheme(
                backgroundColor:
                    getThemeColor(state.weatherModel.weatherCondition),
              ),
            );
          } else {
            theme = ThemeData(
              primaryColor: Colors.blue,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blue,
              ),
            );
          }

          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }

  // Use `Color` instead of `MaterialColor` for more flexibility
  Color getThemeColor(String? condition) {
    if (condition == 'Sunny') {
      return Colors.orange; // This will now apply to the app bar as well
    } else {
      return Colors.pink;
    }
  }
}
