import 'package:egaz/pages/colors.dart';
import 'package:egaz/pages/egazdrawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Dashbooard extends StatefulWidget {
  @override
  _DashbooardState createState() => _DashbooardState();
}

class _DashbooardState extends State<Dashbooard> with TickerProviderStateMixin {
  @override
  AnimationController _controller;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _openDrawer() {
    _drawerKey.currentState.openDrawer();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _controller.value * 100;
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Scaffold(
        key: _drawerKey,
        drawer: EgazDrawer(),
        backgroundColor: appStyleMode.backgroundWhite,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 180,
                      width: double.infinity,
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: appStyleMode.backgroundWhite,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: appStyleMode.backgroundWhite,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 20,
                                    spreadRadius: -2.0,
                                    color:
                                        appStyleMode.secondaryMessageBoxColor,
                                  ),
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                    icon: Icon(Icons.menu,
                                        color:
                                            appStyleMode.primaryTextColorDark),
                                    onPressed: () {
                                      _openDrawer();
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60.0,
                      left: (MediaQuery.of(context).size.width / 2 - 50),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: appStyleMode.backgroundWhite,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 7),
                              blurRadius: 23,
                              spreadRadius: -1,
                              color: appStyleMode.primaryBackgroundColor,
                            ),
                          ],
                          image: DecorationImage(
                            image: ExactAssetImage("assets/EGaz.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration:
                      BoxDecoration(color: appStyleMode.backgroundWhite),
                  width: double.infinity,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () => setState(() {}),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width - 30,
                          height: 250,
                          decoration: BoxDecoration(
                            color: appStyleMode.backgroundWhite,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 20,
                                spreadRadius: -2.0,
                                color: appStyleMode.primaryBackgroundColor,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: IconButton(
                                        icon: Icon(Icons.tonality,
                                            color: Colors.blue[600]),
                                        onPressed: () {}),
                                  ),
                                  Container(
                                    width: 160,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, top: 5),
                                      child: Text(
                                        'Quantite de Gaz actuel',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.0,
                                          color: appStyleMode
                                              .primaryTextColorLight,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 5),
                                      child: Container(
                                        width: 50,
                                        child: Center(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.near_me,
                                                color: Colors.blue[600],
                                                size: 10.0,
                                              ),
                                              onPressed: () {}),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                height: 175,
                                width: 175,
                                child: LiquidCircularProgressIndicator(
                                  value: 0.75, // Defaults to 0.5.
                                  valueColor: AlwaysStoppedAnimation(Colors
                                      .blue), // Defaults to the current Theme's accentColor.
                                  backgroundColor: Colors
                                      .white, // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.blue[600],
                                  borderWidth: 5.0,
                                  direction: Axis
                                      .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    '75 % ',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      InkWell(
                          onTap: null,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width - 30,
                            height: 60,
                            decoration: BoxDecoration(
                              color: appStyleMode.backgroundWhite,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12.0,
                                    color: appStyleMode.primaryTextColorLight,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
