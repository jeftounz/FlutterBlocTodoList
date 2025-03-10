import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc1/blocs/task/task_bloc.dart';
import 'package:flutter_bloc1/blocs/category/category_bloc.dart';
import 'package:flutter_bloc1/repositories/auth_repository.dart';
import 'package:flutter_bloc1/repositories/task_repository.dart';
import 'package:flutter_bloc1/repositories/category_repository.dart';
import 'package:flutter_bloc1/screens/login_screen.dart';
import 'package:flutter_bloc1/screens/signup_screen.dart';
import 'package:flutter_bloc1/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(taskRepository: TaskRepository()),
        ),
        BlocProvider<CategoryBloc>(
          create:
              (context) =>
                  CategoryBloc(categoryRepository: CategoryRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'TodoApp',
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
