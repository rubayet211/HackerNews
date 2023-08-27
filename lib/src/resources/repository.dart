import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsAPIProvider apiProvider = NewsAPIProvider();

  fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  fetchItem(int id) async {
    await dbProvider.fetchItem(id);
  }
}
