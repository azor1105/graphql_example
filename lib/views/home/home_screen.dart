import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:graphql_example/cubits/country_cubit/country_cubit.dart';
import 'package:graphql_example/views/detail_country/detail_country_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionFailure) {
              return const Center(
                child: Text("Error ocured"),
              );
            } else if (state.status == FormzStatus.submissionSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.countriesInfo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                           context
                              .read<CountryCubit>()
                              .getDetailCountryInfoByCode(
                                  code: state.countriesInfo[index].code);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailCountryScreen(),
                            ),
                          );
                        },
                        leading: Text(
                          state.countriesInfo[index].emoji,
                          style: const TextStyle(fontSize: 20),
                        ),
                        title: Text(state.countriesInfo[index].name),
                        trailing: Text(state.countriesInfo[index].code),
                      ),
                    ),
                  );
                },
              );
            } else if (state.status == FormzStatus.submissionInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
