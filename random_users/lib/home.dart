import 'package:flutter/material.dart';

import 'package:random_users/model/user.dart';
import 'package:random_users/services/user_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? error;
  List<User> users = [];

  /// Make the API call once the app luanches
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final responds = await UserAPI.fetchUsers();
    setState(() {
      users = responds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final gender = user.gender;
            final phone = user.phone;
            return Card(
              color:
                  gender == "male" ? Colors.teal[200] : Colors.deepPurple[200],
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(email),
                  ),
                  Text(phone),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
