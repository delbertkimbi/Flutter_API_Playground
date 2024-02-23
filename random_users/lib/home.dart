import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_users/model/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? error;
  List<User> users = [];

  void fetchUsers() async {
    debugPrint("Getting Users");
    const url = "https://randomuser.me/api/?results=30";
    try {
      final uri = Uri.parse(url);
      final responds = await http.get(uri);
      final json = jsonDecode(responds.body);
      final results = json["results"] as List<dynamic>;
      final transformed = results.map((e) {
        final name = UserName(
          tittle: e['name']['tittle'],
          first: e['name']['first'],
          last: e['name']['last'],
        );
        return User(
          gender: e["gender"],
          email: e['email'],
          nat: e['nat'],
          phone: e['phone'],
          cell: e['cell'],
          name: name,
        );
      }).toList();
      setState(() {
        users = transformed;
      });
      debugPrint("Got users");
    } catch (e) {
      error = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: error != null
          ? Center(
              child: Text("Error: $error"),
            )
          : Center(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final email = user.email;
                  final gender = user.gender;
                  final phone = user.phone;
                  return Card(
                    color: gender == "male"
                        ? Colors.teal[200]
                        : Colors.deepPurple[200],
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
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
