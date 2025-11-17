


import 'dart:io';

import 'package:http/http.dart'as http;


class LoginRepository{


  Future<http.Response> login ( email,password)async{


try {
  var response = await http.post(Uri.parse('https://reqres.in/api/login'),
      body: {
        'email': email,
        'password': password
      },
      headers: {
        'x-api-key': 'reqres-free-v1'
      }


  );

  return response;
}
on SocketException {
  throw ("Sockekkt Exception is there");

}










  }

}