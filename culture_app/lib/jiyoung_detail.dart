import 'package:flutter/material.dart';
import 'place_detail_main.dart';
import 'place_detail.dart';
import 'place_reviews.dart';
import 'place_contents.dart';
import 'bottomNav.dart';

import 'jiyoung_detail.dart';
import 'jiyoung_contents.dart';
import 'jiyoung_review.dart';
import 'jiyoung_detail_main.dart';



class jiyoung_detail extends StatefulWidget {

  @override
  State<jiyoung_detail> createState() => _jiyoung_detailState();
}

class _jiyoung_detailState extends State<jiyoung_detail> {
  @override
//asdfasdfsadf
  Route _createRoute1() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => jiyoung_review(),
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
      pageBuilder: (context, animation, secondaryAnimation) => jiyoung_contents(),
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
                  MaterialPageRoute(builder: (context) => jiyoung_detail_main()),
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
        '???????????? ?????? ?????????\n????????? ???????????? ?????? ?????? ????????? ???????????????\n\n????????? ????????????????????? ???????????? ????????? ?????? ????????? ?????? ???????????? ????????? ??? ??? ?????? \n\n2022-22 ????????? ???????????? ????????? <?????????>',
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
                'http://ticketimage.interpark.com/rz/image/play/goods/poster/21/21012360_p_s.jpg',
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
                    '?????????????????????',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:20),
                  child: const Text(
                    '?????????/??????',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left:20,top:20),
                    child: const Text(
                        '?????? ????????? ???????????? 155',
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
