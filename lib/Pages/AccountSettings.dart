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
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Expanded(
                  child: ListView(
        
                  children: <Widget>[
                      ListTile(
                        title: const Text('Name'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Number'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Email'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Name'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Notification'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                      const Divider(color: Color(0xffcecece)),
                      
                    ] 
                  ),
                )
      ),
    );
  }
}