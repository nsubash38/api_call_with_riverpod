import 'package:api_call_with_riverpod/features/posts/model/posts.dart';
import 'package:api_call_with_riverpod/features/posts/resources/posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsStateManagement extends ChangeNotifier {
  PostsRepository _postsRepository = PostsRepository();
  List<Post> allPosts = [];
  fetchAllPosts() async {
    print("here");
    final _res = await _postsRepository.fetchAllPosts();

    if (_res.data != null) {
      allPosts = _res.data!;
    } else {
      allPosts = [];
    }
    print(allPosts);
    notifyListeners();
  }
}
