import 'package:appfood/Bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterProvider extends StatelessWidget {
  final Widget child;
  const CounterProvider({Key? key, required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child:child,
    );
  }
}
