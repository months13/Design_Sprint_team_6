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

class jiyoung_contents extends StatefulWidget {


  @override
  State<jiyoung_contents> createState() => _jiyoung_contentsState();
}

class _jiyoung_contentsState extends State<jiyoung_contents> {

  Route _createRoute1() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => jiyoung_detail(),
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
  @override
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
            Navigator.of(context).push(_createRoute1());


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
            Navigator.of(context).push(_createRoute2());


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
        '?????????\n\n2012.02 ????????????????????? ????????????\n'
        '2009.11 ?????? ?????? ????????? ?????????????????? ????????? ????????? ??????\n'
      '2021. TV?????? <????????? ????????????> ?????? ?????????\n'
      '2021. JTBC <????????????>\n'
      '2020. MBN <?????????> ??????\n'
      '2016. MBC <???????????????> MC\n'
      '2015. MBC FM????????? <?????? ????????? ??????> ?????? DJ\n'
      '2015. Mnet <????????????K 7> ????????????\n'
      '2014. Mnet <????????????K 6> ????????????\n'
      '2013. Mnet <????????? ?????? ????????? 2> ????????????\n'
      '2012. Mnet <????????? ?????? ????????? 1> ????????????  ??? ??????\n',
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
