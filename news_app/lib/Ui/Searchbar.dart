import 'package:flutter/material.dart';
import 'package:news_app/backend/functions.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    controller: SearchBar.searchcontroller,
                    decoration: InputDecoration(
                        hintText: 'Search a Keyword or a Phrase',
                        border: InputBorder.none),
                  ))
                ],
              )),
            ),
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              fetchnews();
            },
            child: Container(
              width: 45,
              height: 45,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
    );
  }
}