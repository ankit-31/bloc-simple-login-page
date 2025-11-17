
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart'as http;

import '../../model/postmodel.dart';

class PostRepository{

Future<List<PostModel>> getResult ()async{


  try {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      var data= jsonDecode(response.body.toString()) as List;

      return data.map((e){
       return PostModel(
         postId: e['postId'] as int,
         name: e['name'],
         email: e['email'],
         body: e['body'],

       );

      }).toList();






    }
    else {

    }

  }
  on SocketException{
    throw Exception('socket exception');
  }
  throw Exception('error while fetchinggg...');


  }

}