import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: buildShimmerContainer(),
          subtitle: buildShimmerContainer(),
        ),
        Divider(height: 8.0)
      ],
    );
  }

  Widget buildShimmerContainer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        color: Colors.grey[200],
        height: 24.0,
        width: 50.0,
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      ),
    );
  }
}
