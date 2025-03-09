import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/bloc/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/ui_presentation/widgets/toggle_theme.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boilerplate'),
        actions: [
          CustomToggleTheme(),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Текущее значение:", style: TextStyle(fontSize: 20)),

          // 1. Используем BlocBuilder для отслеживания изменений состояния
          BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Text('$count', style: TextStyle(fontSize: 40));
            },
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().decrement(),
                child: Icon(Icons.remove),
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                child: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(context.watch<CounterCubit>().show().toString(),
              style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
