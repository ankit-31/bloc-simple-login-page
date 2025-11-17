

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
abstract class LoginEvent extends Equatable{

  @override
  List<Object> get props=>[];





}

class EmailEvent extends LoginEvent{
  String ?email;
  EmailEvent({required this.email});
  @override
  List<Object> get props => [email!];

}
class PasswordEvent extends LoginEvent{
  String?pass;
  PasswordEvent({required this.pass});
  @override
  List<Object> get props => [pass!];

}

class LoginSubmitted extends LoginEvent{

  String ?email,password;
  LoginSubmitted({required this.email,required this.password});
  @override
  List<Object> get props => [email!,password!];





}