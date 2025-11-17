import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/bloc/post/post_bloc.dart';
import 'package:multiplestate/bloc/post/post_event.dart';
import 'package:multiplestate/bloc/post/post_state.dart';
import 'package:multiplestate/utils/enum.dart';

class Apihomepage extends StatefulWidget {
  const Apihomepage({super.key});

  @override
  State<Apihomepage> createState() => _ApihomepageState();
}

class _ApihomepageState extends State<Apihomepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //call api
    context.read<PostBloc>().add(PostRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.poststatus) {
            case PostStatus.loading:
              return CircularProgressIndicator();
            case PostStatus.failure:
              return Text('Error is there');

            case PostStatus.success:
              return Column(
                children: [
                  SearchBar(
                    onChanged: (changed) {
                      context.read<PostBloc>().add(PostFilterEvent( query: changed));
                    },
                    hintText: 'Search the email',
                  ),


                  Expanded(

                    child: ListView.builder(

                      itemCount: state.tempModel!.isEmpty ? state.postmodel?.length : state.tempModel!.length,


                      itemBuilder: (context, index) {
                        final data=state.tempModel!.isEmpty ? state.postmodel!:state.tempModel!;

                        final item = data[index];
                        return ListTile(
                          leading: Text(item!.postId.toString()),
                          title: Text(item.name.toString()),
                          subtitle: Text(item.email.toString()),
                        );
                      },
                    ),
                  ),
                ],
              );

            case null:
              throw UnimplementedError();
          }
        },
      ),
    );
  }
}
