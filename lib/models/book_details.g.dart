// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookDetailsModelAdapter extends TypeAdapter<BookDetailsModel> {
  @override
  final int typeId = 2;

  @override
  BookDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookDetailsModel(
      category: fields[0] as String,
      category_id: fields[1] as int,
      contributor: fields[2] as String,
      coverage: fields[3] as String,
      creator: fields[4] as String,
      date: fields[5] as String,
      description: fields[6] as String,
      format: fields[7] as String,
      id: fields[8] as int,
      identifier: fields[9] as String,
      img: fields[10] as String,
      language: fields[11] as String,
      publisher: fields[12] as String,
      relation: fields[13] as String,
      source: fields[14] as String,
      subject: fields[15] as String,
      title: fields[16] as String,
      type: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookDetailsModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.category_id)
      ..writeByte(2)
      ..write(obj.contributor)
      ..writeByte(3)
      ..write(obj.coverage)
      ..writeByte(4)
      ..write(obj.creator)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.format)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.identifier)
      ..writeByte(10)
      ..write(obj.img)
      ..writeByte(11)
      ..write(obj.language)
      ..writeByte(12)
      ..write(obj.publisher)
      ..writeByte(13)
      ..write(obj.relation)
      ..writeByte(14)
      ..write(obj.source)
      ..writeByte(15)
      ..write(obj.subject)
      ..writeByte(16)
      ..write(obj.title)
      ..writeByte(17)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
