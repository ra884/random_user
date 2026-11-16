import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_app/models/user_model.dart';
import 'package:random_user_app/providers/user_provider.dart';
import 'package:random_user_app/screens/details_page.dart';

class CustomListtile extends StatelessWidget {
  final UserModel user;
  CustomListtile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(user: user),
                ),
              );
            },
            child: ListTile(
              hoverColor: const Color.fromARGB(255, 245, 241, 246),
              tileColor: const Color.fromARGB(255, 231, 208, 236),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.imageURL),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                user.name,
                style: TextStyle(fontWeight: .bold, fontSize: 20),
              ),
              subtitle: Text(
                user.email,
                style: TextStyle(color: CupertinoColors.inactiveGray),
              ),
            ),
          ),
        );
      },
    );
  }
}
