import 'dart:convert';

import 'package:application_flutter/githubApi/repository.page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rechercheController = TextEditingController();
  final scroolController = ScrollController();
  String? query;
  dynamic data;
  int pageCourante = 0;
  int pageTotal = 0;
  int parPage = 20;
  List<dynamic> liste = [];

  @override
  void initState() {
    // On met en écoute le scrool, arriver à la limite on ajoute
    super.initState();
    scroolController.addListener(() {
      if (scroolController.position.pixels ==
          scroolController.position.maxScrollExtent) {
        setState(() {
          if (pageCourante < pageTotal - 1) {
            ++pageCourante;
            _recherche(query!);
          }
        });
      }
    });
  }

  void _recherche(String query) {
    String url =
        "https://api.github.com/search/users?q=$query&per_page=$parPage&page=$pageCourante";
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        data = json.decode(response.body);
        liste.addAll(data['items']);
        if (data['total_count'] % parPage == 0) {
          pageTotal = data['total_count'] ~/ parPage;
        } else {
          // la méthode floor permet de prendre le resultat sans la décimale
          pageTotal = (data['total_count'] / parPage).floor() + 1;
        }
      });
    }).catchError((erreur) {
      // ignore: avoid_print
      print(erreur);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Api Github ${pageTotal == 0 ? 0 : pageCourante + 1}/$pageTotal"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: rechercheController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Colors.deepOrange, width: 1)),
                        ),
                        // onChanged: (value) => setState(() {
                        //   query = value;
                        // }),
                      )),
                ),
                IconButton(
                  onPressed: () {
                    liste = [];
                    pageCourante = 0;
                    query = rechercheController.text;
                    _recherche(query!);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: Colors.deepOrange,
                      ),
                  controller: scroolController,
                  itemCount: liste.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RepositoryPage(
                                      login: liste[index]['login'],
                                      avatarUrl: liste[index]['avatar_url'],
                                    ))),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      NetworkImage(liste[index]['avatar_url']),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  " ${liste[index]['login']}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 14,
                              child: Text(liste[index]['score'].toString()),
                            )
                          ],
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
