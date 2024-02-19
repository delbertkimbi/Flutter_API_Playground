import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? error;
  List<dynamic> users = [];

  void fetchUsers() async {
    debugPrint("Getting Users");
    const url = "https://randomuser.me/api/?results=30";
    try {
      final uri = Uri.parse(url);
      final responds = await http.get(uri);
      final json = jsonDecode(responds.body);
      setState(() {
        users = json["results"];
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
                  final email = user["email"];
                  final picture = user["picture"]["large"];
                  return Card(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(picture),
                          child: Text((index + 1).toString()),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(email),
                        ),
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
