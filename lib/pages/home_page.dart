import 'package:app1/business_logic/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/l10n/app_localization.dart';

import '../business_logic/bloc/counter_bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home Page".tr(context)),
          actions: [
            IconButton(
              onPressed: () {
                context.go('/settings');
              },
              icon: const Icon(Icons.settings),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.menu),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter_msg".tr(context)),
            const SizedBox(height: 20),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text('0');
                } else if (state is CounterValueChangedState) {
                  return Text(state.counterValue.toString());
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is ConnectedState) {
                  return Text(state.msg);
                } else if (state is NotConnectedState) {
                  return Column(
                    children: [
                      Text(state.msg),
                      const SizedBox(
                        height: 10,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: const FabWidget(),
    );
  }
}

class FabWidget extends StatelessWidget {
  const FabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          heroTag: "btn1",
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
          },
          label: const Text('-'),
        ),
        const SizedBox(width: 4),
        FloatingActionButton.extended(
          heroTag: "btn2",
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(ResetEvent());
          },
          label: Text("reset".tr(context)),
        ),
        const SizedBox(width: 4),
        FloatingActionButton.extended(
          heroTag: "btn3",
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
          },
          label: const Text('+'),
        ),
      ],
    );
  }
}
