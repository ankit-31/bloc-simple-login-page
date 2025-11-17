import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/bloc/switch/switch_bloc.dart';
import 'package:multiplestate/bloc/switch/switch_event.dart';
import 'package:multiplestate/bloc/switch/switch_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar()
      ,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Notification', style: TextStyle(fontSize: 30),),


              BlocBuilder<SwitchBloc, SwitchState>(
                 buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,

                builder: (context, state) {
                  print('notificationnn');//now both is build so we have to make condition build when

                  return Switch(value: state.isSwitch, onChanged: (newvalue) {
                    context.read<SwitchBloc>().add(
                        EnableorDisableSwitchEvent());
                  });
                },
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {

                return Container(
                    height: 200,
                    color: Colors.red.withValues(alpha: state.sliderValue,)
                );
              },
            ),
          ),
          SizedBox(height: 40,),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous,current)=>previous.sliderValue!=current.sliderValue,
            builder: (context, state) {
              print('sliderrr');
              return Slider(value: state.sliderValue, onChanged: (newvalue) {
                context.read<SwitchBloc>().add(SliderEvent(newvalue));

              });
            },
          )
        ],
      ),

    );
  }
}
