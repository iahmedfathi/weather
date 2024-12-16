import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class InfoWeather extends StatelessWidget {
 const  InfoWeather({
    super.key, required this.weatherModel
  });

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          weatherModel.cityName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
        Center(
            child: Text(
          'Updated at ${weatherModel.lastDate.hour}:${weatherModel.lastDate.minute}',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              'https:${weatherModel.image!}',
              fit: BoxFit.cover,
            ),
            Text(
              "${weatherModel.temp.round()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              children: [
                Center(
                    child: Text(
                  '${weatherModel.maxTemp.round()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                )),
                Center(
                    child: Text(
                  '${weatherModel.minTemp.round()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                )),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(weatherModel.weatherCondition,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }
}
