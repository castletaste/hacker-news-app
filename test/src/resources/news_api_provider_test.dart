import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchUpId returns list of id', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });
  test('FetchItem returns amount of data', () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response((jsonEncode(jsonMap)), 200);
    });

    final item = await newsApi.fetchItem(100);

    expect(item.id, 123);
  });
}
