

import 'package:bloc/bloc.dart';
import 'package:multiplestate/bloc/switch/switch_event.dart';
import 'package:multiplestate/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{

  SwitchBloc():super(SwitchState()){
    on<EnableorDisableSwitchEvent>(_enableSwitch);
    on<SliderEvent>(_changeSlider);


  }


void _enableSwitch(EnableorDisableSwitchEvent event,Emitter<SwitchState> emit){
  emit(state.copyWith(isSwitch:!state.isSwitch));//logic here
}

void _changeSlider(SliderEvent event,Emitter<SwitchState>emit){
    emit(state.copyWith(sliderValue: event.value));//yesma value event bata aaxa so event
}



}