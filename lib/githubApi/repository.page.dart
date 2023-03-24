import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RepositoryPage extends StatefulWidget {
  String login;
  String avatarUrl;
  RepositoryPage({super.key, required this.login, required this.avatarUrl});

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  dynamic dataRepository;
  @override
  void initState() {
    super.initState();
    _chargerRepository();
  }

  void _chargerRepository() async {
    String url = "https://api.github.com/users/${widget.login}/repos";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dataRepository = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.login),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatarUrl),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: ((context, index) => ListTile(
                  title: Text('${dataRepository[index]['name']}'),
                )),
            separatorBuilder: ((context, index) => const Divider(
                  height: 2,
                  color: Colors.deepOrange,
                )),
            itemCount: dataRepository == null ? 0 : dataRepository.length),
      ),
    );
  }
}
