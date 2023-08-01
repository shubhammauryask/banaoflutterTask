

import 'package:banaoflutter/model/lessons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget lessonsWidget(BuildContext context,lessonsdata data){
  return Padding(
    padding: const EdgeInsets.only(left: 16,right: 16,bottom: 1),
    child: Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width*0.6,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                child: Image.asset( 'assets/images/woman.png',fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width*0.6,
                  height:MediaQuery.of(context).size.height*0.2,
                )
            ),

            // Image.asset('assets/images/traditional.png'),
            Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child:Column(
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height*0.018,),
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Text(data.Title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff598BED)),maxLines: 2,overflow: TextOverflow.ellipsis,))
                      ],
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Text(data.text1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,))
                      ],
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                    Row(
                      children: [
                        Text(data.text2,style: TextStyle(fontSize: 12,color: Color(0xff6D747A)),),
                        Spacer(),
                        Image.asset(
                          'assets/images/lock.png',
                        ),
                      ],
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    ),
  );
}