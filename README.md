# flutter_bloc1

A new Flutter project.


# Structure of the app

lib/
|-- blocs/
|   |-- auth/
|   |   |-- auth_bloc.dart
|   |   |-- auth_event.dart
|   |   |-- auth_state.dart
|   |-- task/
|   |   |-- task_bloc.dart
|   |   |-- task_event.dart
|   |   |-- task_state.dart
|   |-- category/
|       |-- category_bloc.dart
|       |-- category_event.dart
|       |-- category_state.dart
|-- models/
|   |-- user_model.dart
|   |-- task_model.dart
|   |-- category_model.dart
|-- repositories/
|   |-- auth_repository.dart
|   |-- task_repository.dart
|   |-- category_repository.dart
|-- screens/
|   |-- login_screen.dart
|   |-- signup_screen.dart
|   |-- home_screen.dart
|   |-- task_screen.dart
|   |-- category_screen.dart
|-- widgets/
|   |-- task_item.dart
|   |-- category_item.dart
|-- main.dart