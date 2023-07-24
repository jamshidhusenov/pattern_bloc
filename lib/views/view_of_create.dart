import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';

import '../model/post_model.dart';

Widget viewOfCreate(
    bool isLoading,
    BuildContext context,
    TextEditingController titleController,
    TextEditingController bodyController) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                String title = titleController.text.toString().trim();
                String body = titleController.text.toString().trim();
                Post post = Post(title: title,body: body,userId: 1);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              color: Colors.blue,
              child: const Text("Create a Post",style: TextStyle(color: Colors.white),),

            )
          ],
        )
      ],
    ),
  );
}
