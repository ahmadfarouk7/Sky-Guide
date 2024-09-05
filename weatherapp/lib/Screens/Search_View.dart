import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Widgets/Gradient_AppBar.dart';
import 'package:weatherapp/cubits/Get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const GradientAppBar(
          title1: 'Select your',
          title2: 'city',
          gradientColors: [
            Color(0xff1B2445),
            Color(0xff292D5C),
            Color(0xff433A8B),
            Color(0xff5C42A5),
            Color(0xff6A4AAA),
            Color(0xff874EAC),
          ],
        ),
        body: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 175.0),
                  child: Image.asset(
                    'Assets/images/Animation6.gif',
                    height: 130,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onSubmitted: (value) async {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: value);
                    Navigator.pop(context);
                  },
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    labelText: 'Search',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Enter city name',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.white, // White border
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.white, // White border when not focused
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.white, // White border when focused
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
