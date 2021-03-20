part of 'posts_bloc.dart';

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({this.posts});
}

class FailedToLoadPostsState extends PostsState {
  Error error;
  FailedToLoadPostsState({this.error});
}
