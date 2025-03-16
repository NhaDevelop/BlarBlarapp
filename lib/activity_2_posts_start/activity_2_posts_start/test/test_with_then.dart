// ignore_for_file: avoid_print

import 'package:week_3_blabla_project/activity_2_posts_start/activity_2_posts_start/repository/mock_post_repository.dart';

void main() {
  // 1- Create the repo
  final repository = MockPostRepository();

  // TODO

  // 2- Request the post  - Success
     
  repository.getPost(25).then((post) {
    print("Success: ${post.title} - ${post.description}");
  }).catchError((error) {
    print("Error: $error");
  });
  // TODO

  // 3- Request the post - Failed
     repository.getPost(99).then((post) {
    print("Success: ${post.title} - ${post.description}");
  }).catchError((error) {
    print("Error: $error");
  });
}
  // TODO

