

import 'package:equatable/equatable.dart';
import 'package:multiplestate/bloc/model/postmodel.dart';
import 'package:multiplestate/utils/enum.dart';

class PostState extends Equatable{


  final List<PostModel> ?tempModel;
  final  PostStatus ?poststatus;

  final List<PostModel> ?postmodel;

  String ?message;//for error

  PostState({this.poststatus=PostStatus.loading,
  this.postmodel=  const <PostModel>[],
    this.message='',
    this.tempModel=const <PostModel>[]


  });

  PostState copyWith({PostStatus ?poststatus,List<PostModel> ?postmodel, String ?message,List<PostModel>?tempModel}){
    return( PostState(
      postmodel: postmodel??this.postmodel,
      poststatus: poststatus??this.poststatus,
      message: message??this.message,
      tempModel: tempModel??this.tempModel
    ));


  }




  @override
  List<Object?>get props=>[postmodel,poststatus,message,tempModel];


}