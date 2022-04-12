import 'package:api_call_with_riverpod/common/api_provider.dart';

class PostsAPIProvider {
  late APIProvider apiProvider;
  PostsAPIProvider({required String baseUrl}) {
    (apiProvider = APIProvider(baseUrl: baseUrl));
  }

  fetchAllPosts() async {
    return await apiProvider.get(endPoint: 'posts');
  }
}
