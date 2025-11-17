import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplestate/bloc/login/login_bloc.dart';
import 'package:multiplestate/bloc/login/login_event.dart';
import 'package:multiplestate/bloc/login/login_state.dart';

import '../../bloc/repository/login/login_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: BlocProvider(
        create: (context) => LoginBloc((LoginRepository())),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Screen', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current,previous)=>current.email!=previous.email,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailEvent(email: value));
                    },


                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter your Email Address ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)

                        )
                    ),

                  );
                },
              ),
              SizedBox(height: 30,),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordEvent(pass: value));
                    },
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  );
                },
              ),

              SizedBox(height: 40,),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Sucess')));
                  }
                  if (state.status == LoginStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Errror')));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(

                  builder: (context, state) {
                    return ElevatedButton(onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted(
                          email: state.email, password: state.password));
                    }, child: Text('Login ', style: TextStyle(fontSize: 30),));
                  },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
