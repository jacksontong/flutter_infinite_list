// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/models/post.dart';
import 'package:flutter_infinite_list/models/serializers.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_infinite_list/main.dart';

void main() {
  test('test', () {
    final json = jsonDecode(
        '[{"userId":2,"id":11,"title":"et ea vero quia laudantium autem","body":"delectus reiciendis molestiae occaecati non minima eveniet qui voluptatibus\naccusamus in eum beatae sit\nvel qui neque voluptates ut commodi qui incidunt\nut animi commodi"},{"userId":2,"id":12,"title":"in quibusdam tempore odit est dolorem","body":"itaque id aut magnam\npraesentium quia et ea odit et ea voluptas et\nsapiente quia nihil amet occaecati quia id voluptatem\nincidunt ea est distinctio odio"}]');

    final posts = (standSerializers.deserialize(json,
            specifiedType: builtListPost) as BuiltList<Post>)
        .toList();
    print(posts);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
