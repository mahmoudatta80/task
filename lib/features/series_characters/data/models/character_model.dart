import 'package:hive_flutter/hive_flutter.dart';
part 'character_model.g.dart';

@HiveType(typeId: 0)
class CharacterModel extends HiveObject{
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String status;
  @HiveField(3)
  late final String species;
  @HiveField(4)
  late final String gender;
  @HiveField(5)
  late final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
