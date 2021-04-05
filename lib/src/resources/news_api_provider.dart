import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import 'dart:async';
import 'repository.dart';




class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final _rootId = Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json');
    final response = await client.get(_rootId);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final _rootItems = Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json');
    final response = await client.get(_rootItems);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
