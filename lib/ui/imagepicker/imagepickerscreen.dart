
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/bloc/imagepicker/imagepicker_bloc.dart';
import 'package:multiplestate/bloc/imagepicker/imagepicker_event.dart';

import '../../bloc/imagepicker/imagepicker_state.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context,state){
        if(state.image==null){
        return InkWell(
          onTap: (){
            context.read<ImagePickerBloc>().add(CameraPickerEvents());

          },
          child: CircleAvatar(
            child: Icon(Icons.camera),



          ),
        );}
        else
          {
            return Image.file(File(state.image!.path.toString()));
          }
      }),

    );
  }
}
