import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';

import '../models/user.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        centerTitle: true,
      ),
      body: const UserInformation(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'firstPage'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              final newUser = User(
                  name: 'Laura', age: 30, professions: ['Fullstack Developer']);
              userBloc.add(ActivateUser(newUser));
            },
            color: Colors.blue,
            child: const Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              userBloc.add(SetAge(31));
            },
            color: Colors.blue,
            child: const Text('Cambiar edad',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              const newProfession = 'Nueva prof';
              userBloc.add(AddProfession(newProfession));
            },
            color: Colors.blue,
            child: const Text('Añadir profesion',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
