class User {
  String name;
  int age;
  List<String> profesions;

  User({
    required this.name,
    required this.age,
    required this.profesions,
  });

  User copyWith({String? name, int? age, List<String>? profesions}) => User(
        name: name ?? this.name,
        age: age ?? this.age,
        profesions: profesions ?? this.profesions,
      );
}
