import 'package:flutter/material.dart';

class HomePageData extends StatelessWidget {

  final String title;

  final IconData icon;  

  const HomePageData(this.title, this.icon, {Key? key}) : super(key: key);

  List<Widget> homePageWidget(icon, title) {
    return <Widget>[
      Icon(icon, size: 72, color: Colors.white,), 
      Padding(padding: const EdgeInsets.all(10), 
        child: Text(              
          title,              
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white,  fontWeight: FontWeight.w400, fontSize: 20),
        ),
      )    
    ];
  }  


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,   
      margin: const EdgeInsets.all(5),      
      padding: const EdgeInsets.all(5),      
      height: 256,                  
      child: Center(        
        child: Column(        
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: homePageWidget(icon, title)
        ),
      )      
    );
  }
}