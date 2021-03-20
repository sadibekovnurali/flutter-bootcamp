import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http_cubit_app/data.dart';
import 'package:http_cubit_app/data_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _data = Data();

  PostsBloc() : super(LoadingPostsState());

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if (event is LoadPostsEvent) {
      yield LoadingPostsState();

      try {
        final posts = await _data.getPosts();
        yield LoadedPostsState(posts: posts);
      } catch (e) {
        yield FailedToLoadPostsState(error: e);
      }
    }
  }
}
