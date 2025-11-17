import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/bloc/model/postmodel.dart';
import 'package:multiplestate/bloc/post/post_event.dart';
import 'package:multiplestate/bloc/post/post_state.dart';
import 'package:multiplestate/bloc/repository/post/post_repository.dart';
import 'package:multiplestate/utils/enum.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

//for filter one only
List<PostModel>tempModel=[];
  PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostState()) {
    on<PostRequestEvent>(fetchdata);
    on <PostFilterEvent>(filterdata);
  }

  void fetchdata(PostRequestEvent event, Emitter<PostState> emit)async {
     await postRepository
        .getResult()
        .then((value) {
          emit(
            state.copyWith(
              postmodel: value,
              poststatus: PostStatus.success,
              message: 'Sucess',
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              poststatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }


  //for filter with the help of id

void filterdata(PostFilterEvent event,Emitter<PostState>emit){

    tempModel=state.postmodel!.where((element )=>element.email.toString().contains(event.query.toString())).toList();

    emit(state.copyWith(tempModel: tempModel));


}
}
