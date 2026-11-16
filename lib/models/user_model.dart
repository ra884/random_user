class UserModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  final num age;
  final String imageURL;
  UserModel({
    required this.name,
    required this.address,
    required this.age,
    required this.email,
    required this.imageURL,
    required this.phone,
  });
}

class Users {
  final List<UserModel> users;
  Users({required this.users});
  factory Users.fromJson(Map<String, dynamic> json) {
    final List<UserModel> tempList = json["results"]
        .map<UserModel>(
          (user) => UserModel(
            name: "${user["name"]["first"]} ${user["name"]["last"]}",
            address:
                "${user["location"]["street"]["name"]} , ${user["location"]["city"]}",
            age: user["dob"]["age"],
            email: user["email"],
            imageURL: user["picture"]["large"],
            phone: user["phone"],
          ),
        )
        .toList();
    return Users(users: tempList);
  }
}
