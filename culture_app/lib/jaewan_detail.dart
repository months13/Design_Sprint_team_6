import 'package:flutter/material.dart';
import 'place_detail_main.dart';
import 'place_detail.dart';
import 'place_reviews.dart';
import 'place_contents.dart';
import 'bottomNav.dart';

import 'jaewan_detail.dart';
import 'jaewan_contents.dart';
import 'jaewan_detail_main.dart';
import 'jaewan_review.dart';



class jaewan_detail extends StatefulWidget {

  @override
  State<jaewan_detail> createState() => _jaewan_detailState();
}

class _jaewan_detailState extends State<jaewan_detail> {
  @override
//asdfasdfsadf
  Route _createRoute1() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => jaewan_review(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _createRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => jaewan_contents(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  //asdfasdfsadf
  Widget build(BuildContext context) {

    Color color = Color(0xff6667AB);

    return Scaffold(
      bottomNavigationBar: BottomNavigate(),
      body: ListView(
        children: [
          backSection(),
          titleSection(),
          buttonSection(),
          contentSection(),
        ],
      ),

    );

  }

  int viewindex = 1;

  Widget backSection (){
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xff6667AB),
              iconSize: 25,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => jaewan_detail_main()),
                );
              },
            ),]
        )
    );

  }
  // ???????????? ????????? ?????????
  Widget buttonSection (){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff2F305E),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width:3)),
      height: 35,
      width: 337,
      margin: EdgeInsets.only(right: 30, left: 30),



      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ), onPressed: () {
          },
            child: Text('DETAIL'),
          ),
          Text(
              '???',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ), onPressed: () {
            Navigator.of(context).push(_createRoute2());


          },
            child: Text('CONTENTS'),
          ),
          Text(
              '???',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ), onPressed: () {
            Navigator.of(context).push(_createRoute1());


          },
            child: Text('REVIEW'),
          ),
        ],
      ),
    );
  }

  // ???????????? ?????? ???
  Widget contentSection (){
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
        '?????? ????????? ?????? ????????????.\n????????? ?????????????????? ??????????????? ??????????????????????????? ???????????? ???????????????.',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15,
        ),
        softWrap: true,
      ),
    );


  }

// ??????????????? ????????? ????????? ???
  Widget titleSection (){
    return Container(
      padding: const EdgeInsets.only(left:30,right:30,top:50,bottom:30),
      child: Row(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: Card(
              elevation: 5,
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Plato_Silanion_Musei_Capitolini_MC1377.jpg/213px-Plato_Silanion_Musei_Capitolini_MC1377.jpg',
                width: 117,
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
          ),


          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    '???????????? ?????? ?????????',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:20),
                  child: const Text(
                    '?????????',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left:20,top:20),
                    child: const Text(
                        '??????????????? ???????????????',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        ))
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
