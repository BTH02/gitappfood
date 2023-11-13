import 'package:appfood/bloc/switch/switch_bloc.dart';
import 'package:appfood/bloc/switch/switch_event.dart';
import 'package:appfood/bloc/switch/switch_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [boxShadow()]),
              child: const Icon(CupertinoIcons.bars),
            ),
          ),
          BlocBuilder<SwitchBloc,SwitchState>(builder: (context, state) {
            return Switch(
              value: state.switchValue,
              onChanged: (newValue) {
                newValue ? context.read<SwitchBloc>().add(OnSwitch()) : context.read<SwitchBloc>().add(OffSwitch());
              },
            );
          },)
        ],
      ),
    );
  }
}

BoxShadow boxShadow() {
  return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 10,
      offset: const Offset(0, 3));
}
