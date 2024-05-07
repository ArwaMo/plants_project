class Person {
  String? name;
  String? email;
  String? password;

  Person(this.name, this.email, this.password);

  Person.fromJson(Map json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'password': password};
}
