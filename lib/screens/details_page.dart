import 'package:flutter/material.dart';
import 'package:random_user_app/models/user_model.dart';

class DetailsPage extends StatelessWidget {
  final UserModel user;
  DetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 115, 79, 121),
      ),
      body: Center(
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 242, 239, 243),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color.fromARGB(255, 100, 91, 101)),
          ),

          height: 400,
          child: Center(
            child: Column(
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.imageURL),
                    radius: 40,
                  ),
                ),
                Text(
                  user.name,
                  style: TextStyle(fontWeight: .bold, fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: const Color.fromARGB(255, 115, 79, 121),
                      size: 30,
                    ),
                    title: Text("Email", style: TextStyle(fontWeight: .bold)),
                    subtitle: Text(user.email),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: const Color.fromARGB(255, 78, 62, 81),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: const Color.fromARGB(255, 115, 79, 121),
                      size: 30,
                    ),
                    title: Text("Address", style: TextStyle(fontWeight: .bold)),
                    subtitle: Text(user.address),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
