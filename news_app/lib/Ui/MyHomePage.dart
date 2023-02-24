// ignore_for_file: empty_statements

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Ui/Searchbar.dart';
import 'package:news_app/backend/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List>(
        future: fetchnews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          alignment: Alignment.centerLeft,
                          child: Card(
                            // child: CachedNetworkImage(
                            //   placeholder: (context, url) =>
                            //       CircularProgressIndicator(),
                            //   imageUrl:
                            //       // snapshot.data![index]["imageUrl"]
                            //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnOlm4eSbJJ3l_y78tKAD1ym4PjVnGbokEhkU3vHya&s",
                            //   // imageUrl: urlToImage,
                            //   // placeholder: (context, url) =>
                            //   //     CircularProgressIndicator(),
                            //   // errorWidget: (context, url, error) =>
                            //   //     Icon(Icons.error),
                            // ),
                            child: Image.network(
                                snapshot.data![index]["urlToImage"]),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                  snapshot.data![index]['title'].toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(fontSize: 16))),
                            ),
                          ),
                          Container(
                            child: Text(
                              snapshot.data![index]['author'].toString(),
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                launchURL(snapshot.data![index]["url"]);
                              },
                              child: Text("Read more..."))
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
