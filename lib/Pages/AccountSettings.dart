import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({ Key? key }) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        centerTitle: true,
        backgroundColor: const Color(0xff456990) 
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
        child: Expanded(
          child: ListView(        
            children: <Widget>[
              ListTile(
                title: const Text('Update Name'),
                enabled: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                },
              ),
              const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
              ListTile(
                title: const Text('Update Phone Number'),
                enabled: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                },
              ),
              const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
              ListTile(
                title: const Text('Update Email Address'),
                enabled: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                },
              ),
              const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
              ListTile(
                title: const Text('Update Password'),
                enabled: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                },
              ),
              const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
              ListTile(
                title: const Text('Update Notification settings'),
                enabled: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                },
              ),
              const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
            ] 
          ),
        )
      ),
    );
  }
}