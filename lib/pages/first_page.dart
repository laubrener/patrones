import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // removeruser
                userService.removeUser();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: userService.userExist
          ? UserInformation(user: userService.user!)
          : const Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'secondPage'),
      ),
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
            title: Text("Nombre: ${user.name}"),
          ),
          ListTile(
            title: Text('Edad: ${user.age}'),
          ),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesions.map((e) => ListTile(
                title: Text(e),
              ))
        ],
      ),
    );
  }
}
