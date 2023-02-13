// ignore_for_file: empty_statements

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/Ui/Searchbar.dart';
import 'package:news_app/backend/functions.dart';

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
        backgroundColor: Colors.white,
      ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         physics: BouncingScrollPhysics(),
//         reverse: true,
//         child: Container(
//             width: w,
//             child: FutureBuilder<List>(
//               future: fetchnews(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     child: Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Expanded(
//                             child: Row(
//                               children: [
//                                 Container(
//                                   height: 50,
//                                   alignment: Alignment.centerLeft,
//                                   child: Card(
//                                     child: Image.network(
//                                         snapshot.data![index]["urlToImage"]),
//                                   ),
//                                 ),
      //       Column(
      //         children: [
      //           Expanded(
      //             child: Text(
      //               snapshot.data![index]['author']
      //                   .toString(),
      //               style: TextStyle(color: Colors.black),
      //             ),
      //           ),
      //           Text(
      //             snapshot.data![index]['title'].toString(),
      //             style: TextStyle(color: Colors.black),
      //           ),
      //           Text(
      //             snapshot.data![index]['description']
      //                 .toString(),
      //             overflow: TextOverflow.ellipsis,
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // );
//                         },
//                       ),
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text("${snapshot.error}");
//                 }

//                 // By default, show a loading spinner.
//       return Center(
//                     child: CircularProgressIndicator(
//                   color: Colors.black,
//                 ));
//               },
//             )),
//       ),
      body: FutureBuilder<List>(
        future: fetchnews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Card(
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
                          Container(
                            child: Text(
                              snapshot.data![index]['author'].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              snapshot.data![index]['title'].toString(),
                              style: TextStyle(color: Colors.black),
                              softWrap: kFlutterMemoryAllocationsEnabled,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
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
