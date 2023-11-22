import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_http_request/features/posts/model/post_data_ui_model.dart';
import 'package:bloc_http_request/features/posts/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAdditionEvent>(postAdditionEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchLoadingState());

    // Fetching Post from network layer - Repostiory
    final posts = await PostRepository.fetchPost();

    emit(
      PostFetchedSuccessfullState(
        posts: posts,
      ),
    );
  }

  FutureOr<void> postAdditionEvent(
      PostAdditionEvent event, Emitter<PostsState> emit) async {
    bool success = await PostRepository.addNewPost();
    print(success);
    if (success) {
      emit(PostAddedSuccessfullyState());
    } else {
      emit(PostDidnotAddedSuccessfullyState());
    }
  }
}
