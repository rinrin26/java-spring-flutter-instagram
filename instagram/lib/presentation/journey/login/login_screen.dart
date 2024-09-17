import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/common/constants/app_colors.dart';
import 'package:instagram/presentation/journey/home/home_screen.dart';
import 'package:instagram/presentation/journey/login/login%20bloc/login_bloc.dart';
import 'package:instagram/presentation/widgets/button_widget.dart';
import 'package:instagram/presentation/widgets/text_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Username or password wrong')),
          );
        }
      },
   
      child:  Scaffold(
              backgroundColor: AppColors.primaryBg,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
                  child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Bahasa Indonesia',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.white70),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Image.asset(
                            'assets/images/ig-logo.png',
                            width: 200,
                            height: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            children: [
                              TextFormInputWidget(
                                controller: _usernameController,
                                hintText: 'Username',
                                filled: true,
                                fillColor: AppColors.deepBg,
                                border: true,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormInputWidget(
                                controller: _passwordController,
                                obscureText: true,
                                hintText: 'Password',
                                filled: true,
                                fillColor: AppColors.deepBg,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ButtonWidget(
                            text: 'Login',
                            buttonColor: AppColors.blue,
                            textColor: AppColors.white,
                            borderRadius: 40,
                            btnHeight: 50,
                            onPressed: () async {
                              
                              context.read<LoginBloc>().add(AuthLogin(
                                  username: _usernameController.text,
                                  password: _passwordController.text));
                     

                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white70),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 150, bottom: 10.0),
                          child: Column(
                            children: [
                              ButtonWidget(
                                text: 'Buat Akun Baru',
                                buttonColor: AppColors.deepBg,
                                textColor: AppColors.lightBlue,
                                borderColor: AppColors.lightBlue,
                                borderRadius: 40,
                                btnHeight: 50,
                                onPressed: () => {},
                              ),
                              Image.asset(
                                'assets/images/meta3.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ))
        
    );
  }
}
