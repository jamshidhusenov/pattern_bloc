import 'package:flutter/material.dart';
import 'package:pattern_bloc/model/post_model.dart';

import 'item_of_post.dart';

Widget viewOfHome(List<Post> items, bool isLoading){
  return Stack(
    children: [
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx,index){
            Post post = items[index];
            return itemOfPost(ctx,post);
          }),
      isLoading ? const Center(
        child: CircularProgressIndicator(),
      ):const SizedBox.shrink(),

    ],
  );
}