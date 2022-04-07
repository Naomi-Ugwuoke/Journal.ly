import 'package:flutter/material.dart';

class PopUpForm extends StatefulWidget {  

  const PopUpForm( { Key? key }) : super(key: key);

  @override
  State<PopUpForm> createState() => _PopUpFormState();
}

class _PopUpFormState extends State<PopUpForm> {

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context, 
        builder: (BuildContext context) => 
            AlertDialog(
              title: const Text('Update name'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: nameController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Name',
                        hintText: 'Enter new name here'
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  child: const Text('OK')
                )
              ],
            )          
        ), 
      child: const Text('Update Name')
    );
  }
}