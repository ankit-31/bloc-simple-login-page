import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/bloc/counter/counter_bloc.dart';
import 'package:multiplestate/bloc/imagepicker/imagepicker_bloc.dart';
import 'package:multiplestate/bloc/login/login_bloc.dart';
import 'package:multiplestate/bloc/post/post_bloc.dart';
import 'package:multiplestate/bloc/repository/login/login_repository.dart';
import 'package:multiplestate/bloc/repository/post/post_repository.dart';
import 'package:multiplestate/bloc/switch/switch_bloc.dart';
import 'package:multiplestate/cubit/increment_cubit.dart';
import 'package:multiplestate/ui/cubit/cubitpage.dart';
import 'package:multiplestate/ui/imagepicker/imagepickerscreen.dart';
import 'package:multiplestate/ui/login/login_screen.dart';
import 'package:multiplestate/ui/postapi/apihomepage.dart';
import 'package:multiplestate/ui/switch/switchexample.dart';
import 'package:multiplestate/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>LoginBloc(LoginRepository())),
      BlocProvider(create: (_)=>CounterBloc()),
      BlocProvider(create: (_)=>SwitchBloc()),
      BlocProvider(create: (_)=>ImagePickerBloc(ImagePickerUtils())),
      BlocProvider(create: (_)=>PostBloc(PostRepository()),),
      //cubit demo
      BlocProvider(create: (_)=>IncrementCubit()),
    ],
    child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Cubitpage(),
    ));
  }
}

