import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_app/providers/user_provider.dart';
import 'package:random_user_app/widgets/custom_listtile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 115, 79, 121),
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final data = value.usersObject?.users;
          if (data == null) {
            value.requestUsers();
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Container(
                width: 800,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CustomListtile(user: data[index]);
                  },
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.requestUsers(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
