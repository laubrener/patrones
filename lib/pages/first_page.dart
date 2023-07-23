import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserCubit>().deleteUser();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'secondPage'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        print(state);
        switch (state.runtimeType) {
          case UserInit:
            return const Center(child: Text('No hay información del usuario'));

          case ActiveUser:
            return UserInformation(user: (state as ActiveUser).user);

          default:
            return const Center(child: Text('Estado no reconocido'));
        }

        // if (state is UserInit) {
        //   return const Center(
        //     child: Text('No hay información del usuario'),
        //   );
        // } else if (state is ActiveUser) {
        //   return UserInformation(user: state.user);
        // } else {
        //   return const Center(
        //     child: Text('Estado no reconocido'),
        //   );
        // }
      },
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;
  const UserInformation({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(
            title: Text('Nombre:${user.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user.age}'),
          ),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesions.map(
            (e) {
              return ListTile(
                title: Text(e),
              );
            },
          )
        ],
      ),
    );
  }
}
