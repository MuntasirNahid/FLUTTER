part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

abstract class PostsActionState extends PostsState{}

final class PostsInitial extends PostsState {}

final class PostsFetchLoadingState extends PostsState {}

final class PostsFetchedErrorState extends PostsState {}

final class PostFetchedSuccessfullState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchedSuccessfullState({required this.posts});
}

final class PostAddedSuccessfullyState extends PostsActionState {}

final class PostDidnotAddedSuccessfullyState extends PostsActionState {}
