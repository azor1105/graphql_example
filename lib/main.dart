import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/api/country_api_client.dart';
import 'package:graphql_example/cubits/country_cubit/country_cubit.dart';
import 'package:graphql_example/views/home/home_screen.dart';

void main() {
  runApp(MyApp(
    countryApiClient: CountryApiClient.create(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required CountryApiClient countryApiClient})
      : _countryApiClient = countryApiClient;

  final CountryApiClient _countryApiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => CountryCubit(countryApiClient: _countryApiClient)
            ..getCountriesInfo(),
          child: const HomeScreen()),
    );
  }
}
