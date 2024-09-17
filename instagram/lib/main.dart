import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/presentation/journey/home/comment/bloc/comment_bloc.dart';
import 'package:instagram/presentation/journey/login/login%20bloc/login_bloc.dart';
import 'package:instagram/presentation/journey/login/login_screen.dart';
import 'package:instagram/services/api_instagram_service.dart';

void main() {
  runApp(const InstagramApp());
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(ApiInstagramService())),
        BlocProvider<CommentBloc>(
            create: (context) => CommentBloc(ApiInstagramService())),
      ],
      child: MaterialApp(
        title: 'instagram apps',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
