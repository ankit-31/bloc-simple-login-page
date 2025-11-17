
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter/counter_bloc.dart';
import '../../bloc/counter/counter_event.dart';
import '../../bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('build 1');
    return Scaffold(
        appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
            print('build 2');
            return(  Text(state.count.toString(),style: TextStyle(fontSize: 70),));
          })
          

          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementEvent());

              }, child: Text('Increment')),
              SizedBox(width: 30,),
              ElevatedButton(onPressed: (){

                context.read<CounterBloc>().add(DecrementEvent());
              }, child: Text('Decrement')),
            ],
          )
        ],
      ),


    );
  }
}
