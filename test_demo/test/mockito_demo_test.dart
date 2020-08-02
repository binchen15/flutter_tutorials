import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class Post {
  dynamic data;
  Post.fromJson(this.data);
}

Future<Post> fetchPost(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class MockClient extends Mock implements http.Client {}

main() {
  group("FetchPost group test:", () {
    test("Success HTTP get:", () async {
      final client = MockClient();
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
        (realInvocation) async {
          return http.Response('{"title": "Test"}', 200);
        },
      );
      expect(await fetchPost(client), isA<Post>());
    });

    test("Failed HTTP get:", () async {
      final client = MockClient();
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
        (realInvocation) async {
          return http.Response('NOT FOUND', 404);
        },
      );

      expect(fetchPost(client), throwsException);
    });
  });
}
