import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{

  CounterEvent();
@override
  List<Object>get props=>[];


}

class IncrementEvent extends CounterEvent{

}

class DecrementEvent extends CounterEvent{}