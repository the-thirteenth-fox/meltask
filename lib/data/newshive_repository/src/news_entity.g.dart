// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsHiveEntityAdapter extends TypeAdapter<NewsHiveEntity> {
  @override
  final int typeId = 0;

  @override
  NewsHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsHiveEntity(
      sourceName: fields[0] as String,
      author: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
      url: fields[4] as String,
      urlToImage: fields[5] as String,
      publishedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, NewsHiveEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.sourceName)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
