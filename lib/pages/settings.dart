import 'package:app1/business_logic/cubit/local_cubit/local_cubit.dart';
import 'package:app1/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".tr(context)),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Language".tr(context)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocConsumer<LocalCubit, LocalState>(
                  builder: (context, state) {
                    if (state is ChangeLocalState) {
                      return DropdownButton<String>(
                        value: state.locale.languageCode,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        items: ['ar', 'en'].map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            BlocProvider.of<LocalCubit>(context)
                                .changeLanguage(value);
                          }
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  listener: (context, state) {
                    if (state is ChangeLocalState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Language Changed".tr(context))));
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
