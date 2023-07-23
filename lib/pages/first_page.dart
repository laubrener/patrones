import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controllers/user_controller.dart';
import 'package:states/models/user.dart';
import 'package:states/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: Obx(() => userCtrl.userExist.value
          ? UserInformation(
              user: userCtrl.user.value,
            )
          : const NoInfo()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () =>
            Get.to(const SecondPage(), arguments: {'name': 'Laura', 'age': 30}),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay usuario'),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
    required this.user,
  });

  final User user;
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
            title: Text('Nombre: ${user.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user.age}'),
          ),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions.map((e) => ListTile(
                title: Text(e),
              ))
        ],
      ),
    );
  }
}
