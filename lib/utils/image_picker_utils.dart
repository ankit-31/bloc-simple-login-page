

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{


   final ImagePicker picker= ImagePicker();


   Future<XFile?>cameraCapture()async{
   final XFile? image=await picker.pickImage(source: ImageSource.camera);
   return image;
   }


}