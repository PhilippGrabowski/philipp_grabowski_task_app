import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class S5531 extends StatefulWidget {
  const S5531({super.key});

  @override
  State<S5531> createState() => _S5531State();
}

class _S5531State extends State<S5531> {
  RandomUser? user;
  bool isLoadingUser = false;

  void _loadRandomUser() async {
    setState(() {
      isLoadingUser = true;
    });
    user = await fetchRandomUser();
    setState(() {
      isLoadingUser = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(onPressed: _loadRandomUser, icon: Icon(Icons.refresh)),
          const SizedBox(height: 16),
          if (isLoadingUser)
            CircularProgressIndicator()
          else
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.blueGrey)),
              child: user != null
                  ? Stack(children: [
                      Image.network(user!.imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black54,
                                Colors.black12,
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: Text(
                            '${user!.firstName} ${user!.lastName}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ])
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Klick Refresh-Icon und lade einen zufälligen User',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, height: 1.5),
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}

/// gibt ein Future eines [RandomUser] zurück
Future<RandomUser> fetchRandomUser() async {
  // API-Call
  final response = await http.get(Uri.parse('https://randomuser.me/api'));

  // Wenn der API-Call erfolgreich war, wird das JSON-Objekt in eine RandomUser-Instanz konvertiert.
  if (response.statusCode == 200) {
    final userJson = json.decode(response.body)['results'][0];
    return RandomUser.fromJson(userJson);
  } else {
    throw Exception('Konnte Random User nicht laden.');
  }
}

/// eine Model-Klasse für einen Random User
class RandomUser {
  final String firstName;
  final String lastName;
  final String imageUrl;

  RandomUser({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  // Konvertiert das JSON-Objekt aus dem API-Call in eine RandomUser-Instanz.
  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      imageUrl: json['picture']['large'],
    );
  }
}
