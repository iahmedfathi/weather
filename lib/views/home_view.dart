import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/info_weather.dart';
import 'package:weather_app/widgets/no_weather.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'weather app',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const SearchView();
                    }));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ]),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
          if (state is InitialState) {
            return const NoWeather();
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            return InfoWeather(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Center(child:  Text('ops there was an error of  loading the weather'));
          }
        }));
  }
}
