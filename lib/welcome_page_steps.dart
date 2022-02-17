import 'package:flutter/material.dart';

class WelcomePageStep extends StatefulWidget {
  const WelcomePageStep({ Key? key }) : super(key: key);

  @override
  _WelcomePageStepeState createState() => _WelcomePageStepeState();
}

class _WelcomePageStepeState extends State<WelcomePageStep> {

  var i = 0;  

  void next() {
    setState(() {
      if(i < data.length-1) {
        i += 1;
      }
    });
  }

  void prev() {
    setState(() {
        if(i > 0) {
          i -= 1;
        }
    });
  }

  var ques = [
    'Journal everyday with Zine, the way you do it on a physical journal',
    'Choose your mood for the day. Set colors according to your choice.',
    'Set daily reminders to journal your day every night.',
    'Get an year-end progress report of your moods'
  ];

  var icons = [
    Icons.book,
    Icons.book_sharp,
    Icons.timer,
    Icons.calendar_today_sharp
  ];

  var data = [
    ['Journal everyday with Zine, the way you do it on a physical journal', Icons.book],
    ['Choose your mood for the day. Set colors according to your choice.', Icons.book],
    ['Set daily reminders to journal your day every night.', Icons.timer],
    [ 'Get an year-end progress report of your moods', Icons.calendar_today_sharp]               
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,          
      alignment: Alignment.center,      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          HomePageData(ques[i], icons[i]),
          ElevatedButton(                
            onPressed: next, 
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,      
              children: [        
                Container(
                  margin: const EdgeInsets.only(top: 2, left: 2, bottom: 2, right: 1),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white),
              ],
            ),                   
          ), 
          if(i > 0) 
            ElevatedButton(
              onPressed: prev, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,      
                children: [        
                  const Icon(Icons.chevron_left, color: Colors.white),
                  Container(
                    margin: const EdgeInsets.only(top: 2, left: 2, bottom: 2, right: 1),
                    child: const Text(
                      'Prev',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),                  
                ],
              ),      
            )                 
        ],
      ),
    );
  }
}

class HomePageData extends StatelessWidget {

  final String title;

  final IconData icon;

  const HomePageData(this.title, this.icon, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      height: 192,
      child: Center(
        child: Column(        
          children: [      
            Icon(icon, size: 72, color: Colors.white,),
            Padding(padding: const EdgeInsets.all(10), child: Text(              
              title,              
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
            ),)            
          ]
        ),
      )      
    );
  }
}