import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> Users = [];
  void fetchUsers() async {
    const url = "https://randomuser.me/api/?results=15";
    final uri = Uri.parse(url);
    final responds = await http.get(uri);
    final json = jsonDecode(responds.body);
    setState(() {
      Users = json;
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
      body: ListView.builder(
        itemCount: Users.length,
        itemBuilder: (context, index) {
          final user = Users[index];
          final email = user["email"];
          final picture = user["picuture"]["medium"];
          return Card(
            child: Row(
              children: [
                Image.network(picture),
                const SizedBox(
                  width: 5,
                ),
                ListTile(
                  title: Text(email),
                ),
              ],
            ),
          );
        },
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
