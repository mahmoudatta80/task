import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';

Future registerAndOpenHiveBoxes() async{
  Hive.registerAdapter(CharacterModelAdapter());
  Hive.registerAdapter(EpisodeModelAdapter());
  await Hive.openBox<CharacterModel>('charactersBox');
  await Hive.openBox<EpisodeModel>('episodesBox');
}