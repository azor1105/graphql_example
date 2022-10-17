import 'package:flutter/material.dart';
import 'package:graphql_example/api/country_api_client.dart';

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
    );
  }
}
