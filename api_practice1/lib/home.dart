import 'dart:convert';

import 'package:api_practice/model/team_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  List<Team> teams = [];
  //get teams
  Future getTeams() async {
    var responds = await http.get(Uri.https("balldontlie.io", "api/v1/teams"));
    var jsonData = jsonDecode(responds.body);
    for (var eachTeam in jsonData['100']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("NBA API"),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: getTeams(),
          builder: ((context, snapshot) {
            //Is it done loafing, then show the data"
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(teams[index].abbreviation),
                      subtitle: Text(teams[index].city),
                    ),
                  );
                },
              );
            }
            //if it's still loading, show loagin circle
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
