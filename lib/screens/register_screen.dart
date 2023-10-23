import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/bloc/authentication/auth_event.dart';
import 'package:apple_shop/bloc/authentication/auth_state.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/main.dart';
import 'package:apple_shop/screens/dashbord_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _usernameTextController =
      TextEditingController(text: 'amira2323/asd213@##pmad');
  final _passwordTextController = TextEditingController(text: '12345678');
  final _passwordConfirmTextController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/register.jpg')),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'نام کاربری :',
                      style: TextStyle(fontFamily: 'dana', fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: TextField(
                        controller: _usernameTextController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رمز عبور:',
                      style: TextStyle(fontFamily: 'dana', fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: TextField(
                        controller: _passwordTextController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تکرار رمز عبور :',
                      style: TextStyle(fontFamily: 'dana', fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: TextField(
                        controller: _passwordConfirmTextController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: ((context, state) {
                if (state is AuthInitiateState) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontFamily: 'dana', fontSize: 20),
                      backgroundColor: Colors.blue[700],
                      minimumSize: Size(200, 48),
                    ),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                          AuthRegisterRequest(
                              _usernameTextController.text,
                              _passwordTextController.text,
                              _passwordConfirmTextController.text));
                    },
                    child: Text('ثبت نام'),
                  );
                }

                if (state is AuthLoadingState) {
                  return CircularProgressIndicator();
                }

                if (state is AuthResponseState) {
                  Text widget = Text('');
                  state.reponse.fold((l) {
                    widget = Text(l);
                  }, (r) {
                    widget = Text(r);
                  });
                  return widget;
                }

                return Text('خطای نا مشخص !');
              })),
            ],
          ),
        ),
      ),
    );
  }
}
