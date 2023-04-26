import 'dart:convert';

import 'package:canto_cards_game/game/game_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbOps {
  final supabase = Supabase.instance.client;

  Future<List<Game>> getGames() async {
    final List<dynamic> data = await supabase.from('games').select('*');
    if (data.isEmpty) {
      // handle empty data
      return [];
    }
    List<Game> games = data.map((e) => Game.fromJson(e)).toList();
    return games;
  }

  Future<String> insertGame(String name) async {
    final List<Map<String, dynamic>> data = await supabase.from('games').insert([
      {'name': name},
    ]).select();
    return data.first['name'];
  }
}
