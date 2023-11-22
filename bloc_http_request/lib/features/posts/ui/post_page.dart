import 'package:bloc_http_request/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      bloc: postsBloc,
      listenWhen: (previous, current) => current is PostsActionState,
      buildWhen: (previous, current) => current is! PostsActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostsFetchLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PostFetchedSuccessfullState:
            final successState = state as PostFetchedSuccessfullState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Post Request'),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  postsBloc.add(PostAdditionEvent());
                },
              ),
              body: ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.greenAccent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'post title: ${successState.posts[index].title}'),
                              Text(
                                  'post body: ${successState.posts[index].body}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
