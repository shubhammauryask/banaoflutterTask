import 'dart:convert';
import 'dart:developer';

import 'package:banaoflutter/model/eventandexperiences.dart';
import 'package:banaoflutter/model/lessons.dart';
import 'package:banaoflutter/model/programe.dart';
import 'package:banaoflutter/widget/Programe.dart';
import 'package:banaoflutter/widget/eventWidget.dart';
import 'package:banaoflutter/widget/lessonswidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<dynamic> programs = [];
  List<dynamic> lessons = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
    _fetchDatalessons();
  }

  Future<void> _fetchData() async {
    try {
      var url = Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        var items = responseBody['items'];
        // log(items.toString());
        items.forEach((item){
          programs.add(programsdata(Title: item['category'], text1: item['name'], text2: item['lesson'].toString()));
        });
        log(programs.toString());
        setState(() {

        });
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _fetchDatalessons() async {
    try {
      var url = Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        var items = responseBody['items'];
        // log(items.toString());
        items.forEach((item){
          lessons.add(lessonsdata(Title:item['category'], text1: item['name'], text2: item['duration'].toString(), lock: item['locked'].toString()));
        });
        log(lessons.toString());
        setState(() {

        });
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  int _currentIndex = 0;
  int Selected =1;
  var eventList = [
    eventsdata(image:'assets/images/woman.png',Title: 'Babycare', text1: 'Understanding of human behaviour', text2:'13 Feb, Sunday'),
    eventsdata(image:'assets/images/woman.png',Title: 'Babycare', text1: 'Understanding of human behaviour', text2:'13 Feb, Sunday'),
  ];
  // var lessonsList = [
  //   lessonsdata(image:'assets/images/woman.png' , Title: 'Babycare', text1: 'Understanding of human behaviour',lock:'assets/images/lock.png', text2: '3 min'),
  //   lessonsdata(image:'assets/images/woman.png' , Title: 'Babycare', text1: 'Understanding of human behaviour',lock:'assets/images/lock.png', text2: '3 min'),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05,top: MediaQuery.of(context).size.height*0.03 ),
             child: Row(
               children: [
                 Image.asset('assets/images/icon1.png',height: MediaQuery.of(context).size.height*0.08,),
                 Spacer(),
                 Image.asset('assets/images/forumblack24dp.png',color: Color(0xff939CA3),),
                 SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                 Icon(Icons.notifications_outlined,color: Color(0xff939CA3),),
                 SizedBox(width: MediaQuery.of(context).size.width*0.04,),
               ],
             ),
           ),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05 ,top: MediaQuery.of(context).size.height*0.02),
             alignment: Alignment.topLeft,
             child: Text('Hello, Priya!',style: TextStyle(
               fontSize: 20,
               color: Color(0xff08090A),fontWeight: FontWeight.bold,
             ),textAlign: TextAlign.start,),
           ),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05 ),
             alignment: Alignment.topLeft,
             child: Text('What do you wanna learn today?',style: TextStyle(
               fontSize: 12,
               color: Color(0xff6D747A),fontWeight: FontWeight.bold,
             ),textAlign: TextAlign.start,),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.05,),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05, ),
             child: Row(
               children: [
                 Container(
                   height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.42,
                   child: OutlinedButton(
                       onPressed: (){},

                       child:Row(
                         children: [
                           Image.asset('assets/images/bookmark.png'),
                           SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                           Text('Programs',style: TextStyle(
                             fontSize: 14,color: Color(0xff598BED)
                           ),)
                         ],
                       ),

                     style: OutlinedButton.styleFrom(
                       side: BorderSide(color: Color(0xff598BED))
                     ),
                   ),
                 ),
                 Spacer(),
                 Container(
                   height: MediaQuery.of(context).size.height*0.07,
                   width: MediaQuery.of(context).size.width*0.42,
                   child: OutlinedButton(
                     onPressed: (){},

                     child:Row(
                       children: [
                         Image.asset('assets/images/helpcircle.png'),
                         SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                         Text('Get help',style: TextStyle(
                             fontSize: 14,color: Color(0xff598BED)
                         ),)
                       ],
                     ),

                     style: OutlinedButton.styleFrom(
                         side: BorderSide(color: Color(0xff598BED))
                     ),
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(height:MediaQuery.of(context).size.height*0.019,),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05, ),
             child: Row(
               children: [
                 Container(
                   height: MediaQuery.of(context).size.height*0.07,
                   width: MediaQuery.of(context).size.width*0.42,
                   child: OutlinedButton(
                     onPressed: (){},

                     child:Row(
                       children: [
                         Image.asset('assets/images/bookopen.png'),
                         SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                         Text('Learn',style: TextStyle(
                             fontSize: 14,color: Color(0xff598BED)
                         ),)
                       ],
                     ),

                     style: OutlinedButton.styleFrom(
                         side: BorderSide(color: Color(0xff598BED))
                     ),
                   ),
                 ),
                 Spacer(),
                 Container(
                   height: MediaQuery.of(context).size.height*0.07,
                   width: MediaQuery.of(context).size.width*0.42,
                   child: OutlinedButton(
                     onPressed: (){},

                     child:Row(
                       children: [
                         Image.asset('assets/images/trello.png'),
                         SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                         Text('DD Tracker',style: TextStyle(
                             fontSize: 14,color: Color(0xff598BED)
                         ),)
                       ],
                     ),

                     style: OutlinedButton.styleFrom(
                         side: BorderSide(color: Color(0xff598BED))
                     ),
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.06,),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05 ),
             child:Row(
               children: [
                 Text('Programs for you',style: TextStyle(
                   fontSize: 18,
                   color: Color(0xff08090A),fontWeight: FontWeight.bold,
                 ),textAlign: TextAlign.start,),
                 Spacer(),
                 Row(
                   children: [
                     Text('View all',style: TextStyle(
                       fontSize: 12   ,
                       color: Color(0xff6D747A),fontWeight: FontWeight.bold,
                     ),),
                     Icon(Icons.arrow_right_alt_outlined,color: Color(0xff6D747A),)
                   ],
                 )
               ],
             ),
             alignment: Alignment.topLeft,
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.04,),//programs
           Container(
             height: MediaQuery.of(context).size.height*0.4,
             width: MediaQuery.of(context).size.width,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: programs.length,
                 itemBuilder:(context , index){
                   return programsWidget(context,programs[index]);
                 }
             ),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.04,),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05 ),
             child:Row(
               children: [
                 Text('Events and experiences',style: TextStyle(
                   fontSize: 18,
                   color: Color(0xff08090A),fontWeight: FontWeight.bold,
                 ),textAlign: TextAlign.start,),
                 Spacer(),
                 Row(
                   children: [
                     Text('View all',style: TextStyle(
                       fontSize: 12   ,
                       color: Color(0xff6D747A),fontWeight: FontWeight.bold,
                     ),),
                     Icon(Icons.arrow_right_alt_outlined,color: Color(0xff6D747A),)
                   ],
                 )
               ],
             ),
             alignment: Alignment.topLeft,
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.03,),
           Container(
             height: MediaQuery.of(context).size.height*0.37,
             width: MediaQuery.of(context).size.width,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: eventList.length,
                 itemBuilder:(context , index){
                   return eventsWidget(context,eventList[index]);
                 }
             ),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.03,),
           Container(
             margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05 ),
             child:Row(
               children: [
                 Text('Lessons for you',style: TextStyle(
                   fontSize: 18,
                   color: Color(0xff08090A),fontWeight: FontWeight.bold,
                 ),textAlign: TextAlign.start,),
                 Spacer(),
                 Row(
                   children: [
                     Text('View all',style: TextStyle(
                       fontSize: 12   ,
                       color: Color(0xff6D747A),fontWeight: FontWeight.bold,
                     ),),
                     Icon(Icons.arrow_right_alt_outlined,color: Color(0xff6D747A),)
                   ],
                 )
               ],
             ),
             alignment: Alignment.topLeft,
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.03,),
           Container(
             height: MediaQuery.of(context).size.height*0.37,
             width: MediaQuery.of(context).size.width,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: lessons.length,
                 itemBuilder:(context , index){
                   return lessonsWidget(context,lessons[index]);
                 }
             ),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*0.03,),

         ],
       ),
     ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
             label: 'Home',
            activeIcon: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.12,
                  height: 3,
                  color: Color(0xff598BED),
                ),
                SizedBox(height: 10,),
                Icon(Icons.home,color:Color(0xff598BED),),
                SizedBox(height: 5,),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/book.png',color: _currentIndex == 1?Color(0xff598BED):Color(0xff6D747A)),
            label: 'Learn',
            activeIcon: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.12,
                  height: 3,
                  color: Color(0xff598BED),
                ),
                SizedBox(height: 10,),
                Image.asset('assets/images/book.png',color: _currentIndex == 1?Color(0xff598BED):Color(0xff6D747A)),
                SizedBox(height: 5,),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Icon3.png',color: _currentIndex == 2?Color(0xff598BED):Color(0xff6D747A)),
            label: 'Hub',
            activeIcon: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.12,
                  height: 3,
                  color: Color(0xff598BED),
                ),
                SizedBox(height: 10,),
                Image.asset('assets/images/Icon3.png',color: _currentIndex == 2?Color(0xff598BED):Color(0xff6D747A)),
                SizedBox(height: 5,),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/chat.png',color: _currentIndex == 3?Color(0xff598BED):Color(0xff6D747A)),
            label: 'Chat',
            activeIcon: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.12,
                  height: 3,
                  color: Color(0xff598BED),
                ),
                SizedBox(height: 10,),
                Image.asset('assets/images/chat.png',color: _currentIndex == 3?Color(0xff598BED):Color(0xff6D747A)),
                SizedBox(height: 5,),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profilephoto.png',),
            label: 'Profile',
            activeIcon: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.12,
                  height: 3,
                  color: Color(0xff598BED),
                ),
                SizedBox(height: 10,),
                Image.asset('assets/images/profilephoto.png',),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
