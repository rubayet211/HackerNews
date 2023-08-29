import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import 'dart:async';
import 'repository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsAPIProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final String topIdsUrl = '$_root/topstories.json';
    final Uri uri = Uri.parse(topIdsUrl);
    final response = await client.get(uri);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final String itemUrl = '$_root/item/$id.json';
    final Uri uri = Uri.parse(itemUrl);
    final response = await client.get(uri);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
