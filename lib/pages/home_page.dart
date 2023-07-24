import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import 'package:pattern_bloc/bloc/list_post_state.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/pages/create_page.dart';
import 'package:pattern_bloc/views/view_of_home.dart';

import '../services/http_service.dart';
import '../views/item_of_post.dart';
import '../views/view_of_error.dart';
import '../views/view_of_loading.dart';
import '../views/view_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
          builder: (BuildContext context, ListPostState state) {
            if (state is ListPostError) {
              return viewOfHome(items,false);
            }

            if (state is ListPostLoaded) {
               items = state.posts!;
              return viewOfHome(items,false);
            }

            return viewOfHome(items,true);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         callCreatePage();
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

void callCreatePage()async{
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreatePage()));
    if(result != null){
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
}
}
