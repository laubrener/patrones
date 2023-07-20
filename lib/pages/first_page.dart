import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? UserInformation(
                  user: userService.user,
                )
              : Center(
                  child: Text('No hay información del usuario'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'secondPage'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User? user;

  const UserInformation({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Nombre: ${user?.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user?.age}'),
          ),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('prefesion 1'),
          ),
          ListTile(
            title: Text('prefesion 1'),
          ),
          ListTile(
            title: Text('prefesion 1'),
          ),
        ],
      ),
    );
  }
}
