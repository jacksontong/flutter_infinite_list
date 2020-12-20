import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_infinite_list/models/post.dart';

part 'serializers.g.dart';

const builtListPost = FullType(BuiltList, [FullType(Post)]);

@SerializersFor([Post])
final Serializers serializers = _$serializers;

final standSerializers = (serializers.toBuilder()
      ..addBuilderFactory(builtListPost, () => ListBuilder<Post>())
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
