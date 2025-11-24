import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/cubit/increment_cubit.dart';

class Cubitpage extends StatefulWidget {
  const Cubitpage({super.key});

  @override
  State<Cubitpage> createState() => _CubitpageState();
}

class _CubitpageState extends State<Cubitpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<IncrementCubit, int>(
          //int is state
          builder: (context, state) {
            //state have value
            return ElevatedButton(
              onPressed: () => context.read<IncrementCubit>().increment(),
              child: Text(state.toString()),
            );
          },
        ),
      ),
    );
  }
}
