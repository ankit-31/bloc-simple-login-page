import 'package:equatable/equatable.dart';




class CounterState extends Equatable{

   final int count;
  CounterState({this.count=0});


  //helps to override the count value
  CounterState copyWith({int ?counter}){
    return CounterState(
      count: counter?? this.count

    );
}



  @override

  List<Object?> get props => [count];}