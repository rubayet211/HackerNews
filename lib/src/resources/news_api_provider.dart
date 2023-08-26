import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
import '../models/item_model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsAPIProvider {
  Client client = Client();

  fetchTopIds() async {
    final String topIdsUrl = '$_root/topstories.json';
    final Uri uri = Uri.parse(topIdsUrl);
    final response = await client.get(uri);
    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    final String itemUrl = '$_root/item/$id.json';
    final Uri uri = Uri.parse(itemUrl);
    final response = await client.get(uri);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
