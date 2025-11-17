import 'package:equatable/equatable.dart';

enum LoginStatus { success, failure, loading, initial }

class LoginState extends Equatable {
    final  String email, password, message;
   final LoginStatus? status;

  LoginState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.initial,
    this.message = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object>get props =>[email,password,status!,message];
}
