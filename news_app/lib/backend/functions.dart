import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Ui/Searchbar.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8b1594b806e540358ae4409d000671ba'),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
