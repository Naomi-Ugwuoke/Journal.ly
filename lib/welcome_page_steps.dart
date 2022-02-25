import 'package:flutter/material.dart';

import './home_page_data.dart';

class WelcomePageStep extends StatefulWidget {
  const WelcomePageStep({ Key? key }) : super(key: key);

  @override
  _WelcomePageStepeState createState() => _WelcomePageStepeState();
}

class _WelcomePageStepeState extends State<WelcomePageStep> {

  var i = 0;  

  bool steps = false;

  bool home = false;

  bool logo = true;

  void next() {
    setState(() {

      if(i == data.length-1) {
        steps = false;
        home = true;
      }

      if(i < data.length-1) {      
        i += 1;        
      }
    });
  }

  void prev() {
    setState(() {
        if(i == 0) {                    
          steps = false;
          logo = true;
        }
        if(i > 0) {        
          i -= 1;          
        }                       
    });
  }

  void showSteps(){
    setState(() {  
      logo = false;    
      steps = true;
    });
  }


  var data = [       
    ['Journal everyday with Zine, the way you do it on a physical journal', Icons.book],
    ['Choose your mood for the day. Set colors according to your choice.', Icons.add_reaction_outlined],
    ['Set daily reminders to journal your day every night.', Icons.timer],
    [ 'Get an year-end progress report of your moods', Icons.calendar_today]               
  ];

  Widget navButtons(String type) {   
    return Padding(
      padding: const EdgeInsets.all(2),
      child: 
        type == 'next' || type == 'steps' ?
          ElevatedButton( onPressed: type == 'next' ? next : showSteps, 
            style: 
              type == 'next' ? 
                ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),) 
              : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),          
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,                 
              children: [                       
                Container(
                  margin: const EdgeInsets.only(top: 2, left: 2, bottom: 2, right: 1),
                  child: Text( type == 'next' ? 'Next' : 'Start',                
                    style: const TextStyle(fontSize: 18,  fontWeight: FontWeight.w400, color: Colors.black,),
                  ),                 
                ),        
                const Icon(Icons.chevron_right, color: Colors.black),               
              ],
            ), 
          ) 
        : TextButton(
            onPressed: prev,             
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,      
              children: [                        
                  const Icon(Icons.chevron_left, color: Colors.white),
                Container(
                  margin: const EdgeInsets.only(top: 2, left: 1, bottom: 2, right: 2),
                  child: const Text('Previous',
                    style:  TextStyle(fontSize: 16,  fontWeight: FontWeight.w400, color: Colors.white,),
                  ),                 
                ),                
              ],
            ), 
          )
        ,
    );
  }

  Widget logoScreen() {
    return Column(
      children: [
        Container(
          width: 256,   
          margin: const EdgeInsets.all(5),      
          padding: const EdgeInsets.all(5),      
          height: 256,                  
          child: Center(        
            child: Column(        
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(10), 
                  child: 
                  Text('Journal.ly', 
                    style: TextStyle(fontSize: 36,  color: Colors.white, shadows: [Shadow(offset: Offset(1, 2), blurRadius: 17) ]  ),)
                )            
              ]
            ),
          )      
        ),
        navButtons('steps')
      ],
    );
  }

  Widget homeScreen() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,          
      alignment: Alignment.center,      
      child: Column(        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[   
          if(logo)       
            logoScreen(),
          if(steps)
            HomePageData(data[i][0] as String, data[i][1] as IconData),
          if(steps)
            Column(                      
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.center,            
              children: [                 
              navButtons('next'),    
              if(i >= 0) navButtons('prev'),                  
              ],
            ), 
          if(home)         
            homeScreen()
        ],
      ),
    );
  }
}

