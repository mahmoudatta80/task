import 'package:hive/hive.dart';
part 'episode_model.g.dart';

@HiveType(typeId: 1)
class EpisodeModel extends HiveObject{
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String airDate;
  @HiveField(3)
  late final String episode;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
    );
  }
}