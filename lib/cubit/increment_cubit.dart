import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

//cubit relise on methods not event like bloc
//cubit contains states and based on request it emits(fires) the states.
//while adding event (in bloc) only call methods on cubit
class IncrementCubit extends Cubit<int> {
  IncrementCubit() : super(0);

  void increment()=>emit(state+1);

}
