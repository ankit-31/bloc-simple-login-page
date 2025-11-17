

import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{

  ImagePickerEvent();
  @override
  List<Object>get props =>[];
}

class CameraPickerEvents extends ImagePickerEvent{

}
