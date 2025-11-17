

import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{


  @override
  List<Object> get props=>[];


}
 class PostRequestEvent extends PostEvent{}

class PostFilterEvent extends PostEvent{

  String ?query;
  PostFilterEvent({required this.query});


}