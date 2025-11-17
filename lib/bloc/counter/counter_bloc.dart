import 'package:bloc/bloc.dart';


import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{

  CounterBloc():super( CounterState()){//current state dini
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event,Emitter<CounterState>emit){//emit like setstate
    emit(state.copyWith(counter: state.count+1));

  }

  void _decrement(DecrementEvent event,Emitter<CounterState>emit){

    emit(state.copyWith(counter: state.count-1));
  }
}