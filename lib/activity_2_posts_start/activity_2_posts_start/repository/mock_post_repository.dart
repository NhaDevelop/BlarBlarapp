
// TODO
import 'dart:async';
import '../model/post.dart';
import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int postId) async {
    await Future.delayed(Duration(seconds: 3));
    
    if (postId == 25) {
      return Post(id: 25, title: "Who is the best", description: "Teacher Ronan");
    } else {
      throw Exception("No post found");
    }
  }
}
