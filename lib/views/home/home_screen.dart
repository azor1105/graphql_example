import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:graphql_example/api/country_api_client.dart';
import 'package:graphql_example/cubits/country_cubit/country_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionFailure) {
            return const Center(
              child: Text("Error ocured"),
            );
          } else if (state.status == FormzStatus.submissionSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Text(state.countriesInfo[index].name);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
