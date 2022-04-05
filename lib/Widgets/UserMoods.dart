import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:provider/provider.dart';

class UsersMoods extends StatefulWidget {
  const UsersMoods({ Key? key, required this.profile }) : super(key: key);

  final Profile profile;

  @override
  State<UsersMoods> createState() => _UsersMoodsState();
}

class _UsersMoodsState extends State<UsersMoods> {

  bool errorOccured = false;
  String error = '';  

  Widget moodContainer() {

    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    final Profile profile = Provider.of<Profile>(context, listen: false);    
    
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(profile.userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          Map<String, dynamic> moods = data['moods'];

          List moodList = [];

          if(moods.isNotEmpty) {
              moods.forEach((key, value) => 
              moodList.add({
                "name": key,
                "color": '0xff' + value['r'] + value['g'] + value['b']
              })
            );          
            
            return Padding(
              padding: const EdgeInsets.all(3),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 175,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20), 
                itemCount: moods.length,  
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Color(int.parse(moodList[index]['color']))
                    ),
                    child: Text(moodList[index]['name'].toString().toUpperCase(), style: const TextStyle(fontSize: 16),),                  
                  );
                }
              ),
            );
          }
          else {
            return ElevatedButton(
              onPressed: () {

              }, 
              child: const Text('Add One Now!'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size.fromWidth(200))
              ),
            );
          }
          
        }
        return const Text("loading");
      },
    );
  }

  @override
  Widget build(BuildContext context) {    

    return Container(        
      height: 225,      
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,                
        border: Border.all(width: 1, color: const Color(0xffeeeeee)),        
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4.0, offset: Offset(2, 3))]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Text('Your Moods', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10,),
            if(errorOccured == true) Text(error, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            if(!errorOccured) Expanded(child: moodContainer()),
            const SizedBox(height: 10,),
            TextButton(
              onPressed: () {
                final AppState appState = Provider.of<AppState>(context, listen: false);
                appState.visiblePageIndex = 3;
              }, 
              child: const Text('View All')
            )
          ],
        ),
      ),
    );
  }
}