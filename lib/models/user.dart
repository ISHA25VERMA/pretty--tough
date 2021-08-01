class User{
  final String uid;

  User({required this.uid});
}

class UserData{
  final String? uid;
  final String contact;
  final String age;
  final String description;

  UserData({required this.age, required this.contact, required this.description, required this.uid});

}