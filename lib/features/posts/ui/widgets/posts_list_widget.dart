import 'package:api_call_with_riverpod/features/posts/model/posts.dart';
import 'package:api_call_with_riverpod/features/posts/state_management/posts_state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsProvider = Provider(((ref) => PostsStateManagement()));

class PostsListWidget extends ConsumerWidget {
  const PostsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef watch) {
    final provider = watch.read(postsProvider);
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: ((context, ref, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.fetchAllPosts();
                  },
                  child: const Text("Fetch"),
                ),
                ...List.generate(
                  provider.allPosts.length,
                  (index) => Card(
                      elevation: 3,
                      child: Text("${provider.allPosts[index].title}")),
                ),
              ],
            ),
          );
        })),
      ),
    );
  }
}
