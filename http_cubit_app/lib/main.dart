import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_cubit_app/bloc/posts_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(LoadPostsEvent()),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Http Cubit'),
          ),
          body: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is LoadedPostsState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.posts[index].title),
                      ),
                    );
                  },
                );
              } else if (state is LoadingPostsState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FailedToLoadPostsState) {
                return Center(
                  child: Text('Error occured: ${state.error}'),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
