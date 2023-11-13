import 'package:appfood/bloc/add_to_cart_bloc.dart';
import 'package:appfood/bloc/login/login_bloc.dart';
import 'package:appfood/bloc/switch/switch_bloc.dart';
import 'package:appfood/bloc/switch/switch_state.dart';
import 'package:appfood/enums/theme.dart';
import 'package:appfood/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CartBloc(),
          ),
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return MaterialApp(
              title: "Food App",
              debugShowCheckedModeBanner: false,
              theme: state.switchValue
                  ? AppThemes.themeData[AppTheme.darkTheme]
                  : AppThemes.themeData[AppTheme.lightTheme],
              routes: Routes.routes,
              initialRoute: Routes.login,
            );
          },
        ));
  }
}
