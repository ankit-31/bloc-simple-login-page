

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SwitchEvent extends Equatable{

  SwitchEvent();
  @override
  List<Object>get props =>[];

}

class EnableorDisableSwitchEvent extends SwitchEvent{

}

class SliderEvent extends SwitchEvent{//equtable ko method ni override garnuparyo
  double value;
  SliderEvent(this.value);
  @override
  List<Object>get props=>[value];

}
