import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _location = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profile(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(height: 0, thickness: 1),
              ),
              const ListTile(
                title: Text(
                  'Language',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  'English',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ListTile(
                title: const Text(
                  'Location',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: CupertinoSwitch(
                  value: _location,
                  onChanged: (v) => setState(() => _location = v),
                ),
              ),
              ListTile(
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: CupertinoSwitch(
                  value: _notifications,
                  onChanged: (v) => setState(() => _notifications = v),
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Notification Settings',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              divider(),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Share this app',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Rate this app',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              divider(),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Help',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Privacy',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Terms & Conditions',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              const SizedBox(height: 30),
              logoutButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1513152697235-fe74c283646a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Manuel Ahuno',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 0, thickness: 1),
    );
  }

  Widget logoutButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
        ),
      ),
    );
  }
}
