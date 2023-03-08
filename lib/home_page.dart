import 'package:app1/app_localization.dart';
import 'package:app1/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home Page'),
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
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
          },
          label: const Text('-'),
        ),
        const SizedBox(width: 4),
        FloatingActionButton.extended(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(ResetEvent());
          },
          label: Text("reset".tr(context)),
        ),
        const SizedBox(width: 4),
        FloatingActionButton.extended(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
          },
          label: const Text('+'),
        ),
      ],
    );
  }
}
