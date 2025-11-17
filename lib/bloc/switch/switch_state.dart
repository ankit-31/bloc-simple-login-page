

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{

  //what will be value of switch (state) bool so
  bool isSwitch;
  double sliderValue;

  SwitchState({
    this.isSwitch=false,
    this.sliderValue=0.4
});
  SwitchState copyWith({bool ?isSwitch,double ?sliderValue}){
    return SwitchState(
      isSwitch: isSwitch??this.isSwitch,
      sliderValue: sliderValue??this.sliderValue
    );


  }


  @override
  List<Object?> get props => [isSwitch,sliderValue];



}