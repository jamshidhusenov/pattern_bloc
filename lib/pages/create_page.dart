import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';
import 'package:pattern_bloc/bloc/create_post_state.dart';

import '../views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create post"),
      ),
      body: BlocProvider(create: (context)=>CreatePostCubit(),
      child: BlocBuilder<CreatePostCubit,CreatePostState>(
          builder: (BuildContext context,CreatePostState state){

            if(state is CreatePostLoading){
              return viewOfCreate(true,context,titleController,bodyController);
            }

            if(state is CreatePostLoaded){

            }

            if(state is CreatePostError){

            }
            return viewOfCreate(false,context,titleController,bodyController);

          }),
      )
    );
  }
}
