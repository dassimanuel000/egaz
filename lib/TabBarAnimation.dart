import 'dart:math';

import 'package:egaz/pages/Dashbooard/Dashbooard.dart';
import 'package:egaz/pages/EgazRecovery/EgazRecovery.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:egaz/pages/colors.dart';
import 'package:egaz/pages/profile.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';

class TabBarAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

//class _BubblesState extends State<TabBarAnimation> with SingleTickerProviderStateMixin{
class _BubblesState extends State<TabBarAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  List<Bubble> bubbles;
  final int numberOfBubbles = 400;
  final Color color = Color(0xDD01549F);
  final double maxBubbleSize = 12.0;
  int _page = 0;

  final Dashbooard _dashbooard = Dashbooard();
  final EgazRecovery _egazRecovery = new EgazRecovery();
  final ProfilePage _profilePage = new ProfilePage();

  Widget _showPage = new Dashbooard();

//  BuildContext get contexte => Container();

  Widget _pageChoose(int page) {
    switch (page) {
      case 0:
        return _dashbooard;
        break;
      case 1:
        return _egazRecovery;
        break;
      case 2:
        return _profilePage;
        break;
      default:
        return new Container(
            child: new Center(
          child: new Text('cliquez sur une icone en bas'),
        ));
    }
  }

  //TabController tabController;

  @override
  void initState() {
    super.initState();
    /////////////////
    //tabController = TabController(vsync: this, length: 4);
    /////////////////
    bubbles = List();
    int i = numberOfBubbles;
    while (i > 0) {
      //bubbles.add(Bubble(color, maxBubbleSize, contexte));
      bubbles.add(Bubble(color, maxBubbleSize));
      i--;
    }

    _controller = new AnimationController(
        duration: const Duration(seconds: 1500), vsync: this);
    _controller.addListener(() {
      updateBubblePosition();
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        //initialIndex: _page,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: appStyleMode.backgroundWhite),
          Icon(Icons.local_mall, size: 30, color: appStyleMode.backgroundWhite),
          Icon(Icons.supervised_user_circle,
              size: 30, color: appStyleMode.backgroundWhite),
        ],
        color: appStyleMode.primaryBlue,
        buttonBackgroundColor: appStyleMode.primaryBlue,
        backgroundColor: appStyleMode.backgroundWhite,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _showPage = _pageChoose(index);
          });
        },
      ),
      body: Container(
        child: _showPage,
      ),
    );
  }

  void updateBubblePosition() {
    bubbles.forEach((it) => it.updatePosition());
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  List<Bubble> bubbles;
  AnimationController controller;

  BubblePainter({this.bubbles, this.controller});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    bubbles.forEach((it) => it.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;
  //double test = 0.4903209748234223;
  //final appStyleMode = Provider.of<AppStyleModeNotifier>(context);

  //Bubble(Color colour, double maxBubbleSize, BuildContext context) {
  Bubble(Color colour, double maxBubbleSize) {
    //var contexte = context;
    //final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    this.colour = Colors.white;
    this.direction = Random().nextDouble() * 360;
    this.speed = 1;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  //static BuildContext get context => null;

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.x = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    var a = 180 - (direction + 90);
    direction > 0 && direction < 100
        ? x += speed * sin(direction) / sin(speed)
        : x -= speed * sin(direction) / sin(speed);
    direction > 90 && direction < 270
        ? y += speed * sin(a) / sin(speed)
        : y -= speed * sin(a) / sin(speed);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = Random().nextDouble() * 360;
    }
  }
}
