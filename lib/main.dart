import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/pages/first_page.dart';
import 'package:states/pages/second_page.dart';

import 'bloc/user/user_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'firstPage',
        routes: {
          'firstPage': (_) => const FirstPage(),
          'secondPage': (_) => const SecondPage(),
        },
      ),
    );
  }
}
