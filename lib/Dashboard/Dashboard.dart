import 'package:flutter/material.dart';
import 'package:flutter_app/Game%20selected/Game.dart';
import 'package:flutter_app/profile/profile.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/search.dart';
import 'package:flutter_app/widgets/gamestitle.dart';
import 'package:flutter_app/widgets/gamestitle2.dart';
import 'package:flutter_app/widgets/horizantal.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //width of the screen
    var width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        color: primaryColor,
        height: height,
        child: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                    child: Text(
                      'Welcome Back,',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Goth"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 54, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15.0,
                          child: Icon(
                            Icons.people,
                            size: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, left: 5),
                          child: Text(
                            'Oneeb Khan',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Goth-bold"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(1.0, 0),
                    child: Container(
                      padding: EdgeInsets.only(top: 40, right: 20),
                      child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Search(),
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: height * 0.1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Goth-Regular"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber,
                                ),
                                height: 100,
                              ),
                              Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'All Games',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 35),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amber,
                              ),
                              height: 100,
                            ),
                            Container(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    'Your Favourite Console',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: Center(
                                child: Text(
                                  'PS4',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                      height: 100,
                      width: width * 0.95,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Gamestitle(),
                  GestureDetector(
                    child: Horizantallayout(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Game(),
                          ));
                    },
                  ),
                  Upcoming(),
                  Horizantallayout(),
                  Upcoming(),
                  Horizantallayout(),
                  Upcoming(),
                  Horizantallayout(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
