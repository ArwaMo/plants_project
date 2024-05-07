import 'package:final_project/models/person_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Services {
  final supabase = Supabase.instance.client;
  insertUserData(Person user) async {
    await supabase.from('Person').insert(user.toJson());
  }

  Future<List<Map<String, dynamic>>> getEmailUser(Person user) async {
    var result = await supabase
        .from('Person')
        .select('email')
        .eq('email', '${user.email}');
    return result;
  }

  Future<List<Map<String, dynamic>>> getEmailPassUser(
      String email, String pass) async {
    var result = await supabase
        .from('Person')
        .select()
        .eq('email', email)
        .eq('password', pass);

    return result;
  }

  Future<List<Person>> getUser() async {
    List<Person> users = [];
    var result = await supabase.from('Person').select();

    for (var element in result) {
      users.add(Person.fromJson(element));
    }

    return users;
  }

  //  Future<List<Person>> deleteUser() async {
  //   List<Person> users = [];
  //   var result = await supabase.from('Person').delete();

  //   for (var element in result) {
  //     users.add(Person.fromJson(element));
  //   }

  //   return users;
  // }
}
