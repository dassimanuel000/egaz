import 'package:flutter/material.dart';
import 'package:egaz/pages/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EgazDrawer extends StatefulWidget {
  @override
  _EgazDrawerState createState() => _EgazDrawerState();
}

class _EgazDrawerState extends State<EgazDrawer> with TickerProviderStateMixin {
  AnimationController _controller;

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

  Future<void> _launched;
  String _url = '';

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: true,
        headers: <String, String>{'egaz ': 'egaz'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(color: appStyleMode.primaryBackgroundColor),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget child) {
                        return ScaleTransition(
                          scale: AlwaysStoppedAnimation<double>(
                              1.0 - (_controller.value) * 0.2),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation<double>(
                                Tween<double>(begin: 0.0, end: 24.0)
                                        .animate(CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.fastOutSlowIn))
                                        .value /
                                    360),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: appStyleMode.primaryTextColor
                                          .withOpacity(0.6),
                                      offset: const Offset(2.0, 4.0),
                                      blurRadius: 8),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(60.0)),
                                child: Image.asset(
                                    'assets/images/features-icon-1.png'),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 4),
                      child: Text(
                        'name user',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: appStyleMode.primaryTextColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Divider(
              height: 1,
              color: appStyleMode.primaryTextColor.withOpacity(0.6),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0.0),
                children: [
                  InkWell(
                    splashColor: Colors.grey.withOpacity(0.1),
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 6.0,
                                height: 46.0,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),
                              Icon(
                                Icons.person_pin,
                                color: appStyleMode.primaryBlue,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),
                              Text(
                                'labelName',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: appStyleMode.primaryTextColor,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget child) {
                            return Transform(
                              transform: Matrix4.translationValues(
                                  (MediaQuery.of(context).size.width * 0.75 -
                                          64) *
                                      (1.0 - _controller.value - 1.0),
                                  0.0,
                                  0.0),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75 -
                                          64,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.2),
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(28),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(28),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: appStyleMode.primaryTextColor.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Website egaz-cm',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: appStyleMode.primaryTextColorDark,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _url = "http://localhost:8000/";
                    _launched = _launchInWebViewOrVC(_url);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
            Divider(
              height: 1,
              color: appStyleMode.primaryTextColor.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Dark Mode ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: appStyleMode.primaryTextColorDark,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.lightbulb_outline,
                    color: appStyleMode.backgroundWhite,
                  ),
                  onTap: () {
                    appStyleMode.switchMode();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
            Divider(
              height: 1,
              color: appStyleMode.primaryTextColor.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: appStyleMode.primaryTextColorDark,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
