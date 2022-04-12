import 'package:api_call_with_riverpod/common/constants.dart';
import 'package:api_call_with_riverpod/common/data_response.dart';
import 'package:api_call_with_riverpod/common/exceptions.dart';
import 'package:api_call_with_riverpod/features/posts/model/posts.dart';
import 'package:api_call_with_riverpod/features/posts/resources/posts_api_provider.dart';

class PostsRepository {
  final PostsAPIProvider _postsAPIProvider =
      PostsAPIProvider(baseUrl: Constants.BASE_URL);
  Future<DataResponse<List<Post>>> fetchAllPosts() async {
    final List<Post> allPosts = [];

    try {
      final response = await _postsAPIProvider.fetchAllPosts();
      var _data =
          (response["data"]).map<Post>((e) => Post.fromJson(e)).toList();
      allPosts.addAll(_data);
      return DataResponse.success(allPosts);
    } on CustomException catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
