import 'package:supabase_flutter/supabase_flutter.dart';

class DbOps {
  final supabase = Supabase.instance.client;

  Future<String> getCities() async {
    final data = await supabase.from('cities').select('name');
    if (data.isEmpty) {
      // handle empty data
      return "";
    }
    return data.first['name'];
  }


}


