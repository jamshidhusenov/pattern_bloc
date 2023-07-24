import 'package:flutter/material.dart';

import '../model/post_model.dart';
import 'item_of_post.dart';

Widget viewOfPostList(List<Post> items) {
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        return itemOfPost(ctx,items[index]);
      });
}