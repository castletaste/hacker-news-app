import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> futureSnapshot) {
        if (!futureSnapshot.hasData) {
          return Text('Still loading Stream');
        }
        return FutureBuilder(
          future: futureSnapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text('Still loading $itemId');
            }
            return Text(itemSnapshot.data.title);
          },
        );
      },
    );
  }
}
