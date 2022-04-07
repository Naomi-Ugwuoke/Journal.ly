import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'package:the_bug_chasers/Widgets/AddMood.dart';

class MoodContainer extends StatefulWidget {

  bool showOptions;

  Color _themeColor;

  MoodContainer( this.showOptions, this._themeColor, { Key? key }) : super(key: key);

  @override
  State<MoodContainer> createState() => _MoodContainerState(this.showOptions, this._themeColor);
}

class _MoodContainerState extends State<MoodContainer> {

  bool showOptions;

  Color _themeColor;

  // bool showActions = false;

  _MoodContainerState(this.showOptions, this._themeColor);  

  Widget moodBox(String color, String name, Function deleteMood) {
    return Column(
      children: [
        Container(   
           height: 100,       
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Color(int.parse(color))
          ),
          child: Text(name.toString(), style: const TextStyle(fontSize: 16, color: Colors.white),),                      
        ),
        if(showOptions) const SizedBox(height: 5,),
        if(showOptions)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddMood(editMode: true, colorName: name.toString(), updateColor: Color(int.parse(color)),),
            const SizedBox(width: 5,),
            TextButton(
              onPressed: (){
                deleteMood(name.toString());
              }, 
              child: const Icon(Icons.delete, color: Colors.red,)
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    final Profile profile = Provider.of<Profile>(context, listen: false);   

    Future<void> deleteMood(String name) async {
      await users.doc(profile.userId).update({"Moods.$name": FieldValue.delete()})
      .then((value) => null)
      .catchError((onError) => null);
    } 
    
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
          Map<String, dynamic> moods = data['Moods'];

          List moodList = [];

          if(moods.isNotEmpty) {
              moods.forEach((key, value) => 
              moodList.add({
                "name": key,
                "color": '0xff' + value[0] + value[1] + value[2]
              })
            );          
            
            return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 175,
                childAspectRatio: showOptions ? 1 : 3/2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 20), 
              itemCount: moods.length,  
              physics: const ScrollPhysics(),              
              itemBuilder: (BuildContext context, index) {
                return moodBox(moodList[index]['color'], moodList[index]['name'], deleteMood);                      
              }            
            );
          }
          else {
            return const Text('No moods found :/');
          }
          
        }
        return const Text("loading");
      },
    );
  }
}