

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiplestate/bloc/imagepicker/imagepicker_event.dart';
import 'package:multiplestate/bloc/imagepicker/imagepicker_state.dart';
import 'package:multiplestate/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{

    final ImagePickerUtils imagePickerutils;

  ImagePickerBloc(this.imagePickerutils):super(ImagePickerState()){

    on<CameraPickerEvents>(camerapicker);
  }

  void camerapicker(CameraPickerEvents event,Emitter<ImagePickerState> emit)async{
    XFile ?file= await imagePickerutils.cameraCapture();
    emit(state.copyWith(image: file));


  }
}