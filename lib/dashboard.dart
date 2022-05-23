import 'package:flutter/material.dart';
import 'package:mytutor/loginscreen.dart';
import 'user.dart';

class Dashboard extends StatefulWidget {
  final User user;
  const Dashboard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(widget.user.name.toString()),
                accountEmail: Text(widget.user.email.toString()),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.myanimelist.net/r/360x360/images/characters/9/310307.jpg?s=56335bffa6f5da78c3824ba0dae14a26"),
                ),
              ),
              _createDrawerItem(
                icon: Icons.tv,
                text: 'My Dashboard',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (content) => Dashboard(
                                user: widget.user,
                              )));
                },
              ),
              _createDrawerItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (content) => const LoginScreen()));
                },
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Welcome To My Tutor Application'),
        ));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
