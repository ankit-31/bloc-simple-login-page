import 'package:bloc/bloc.dart';
import 'package:multiplestate/bloc/login/login_event.dart';
import 'package:multiplestate/bloc/login/login_state.dart';
import 'package:multiplestate/bloc/repository/login/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(LoginState()) {
    on<EmailEvent>(emailChanged);
    on<PasswordEvent>(passwordChanged);
    on<LoginSubmitted>(loginsubmit);
  }

  void emailChanged(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email.toString()));
  }

  void passwordChanged(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.pass.toString()));
  }


  void loginsubmit(LoginSubmitted event,Emitter<LoginState>emit)async{

emit(state.copyWith(status: LoginStatus.loading));
    try{
      final res= await loginRepository.login(state.email, state.password.toString());

      print("hiii "+state.email.toString()+"123");

      if(res.statusCode==200){
        print('hiiiiiiiii');
        emit(state.copyWith(
          status: LoginStatus.success,
          message: 'Success Broo'
        ));
      }
      else{
        emit(state.copyWith(
          status: LoginStatus.failure,
          message: 'Error Broo'
        ));

      }

    }
    catch(e){
      emit(state.copyWith(message: e.toString()));
      print({'errorororoor${e.toString()}'});
    }

  }
}
