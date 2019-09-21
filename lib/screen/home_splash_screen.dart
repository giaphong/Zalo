import 'package:flutter/material.dart';
import 'package:search_view/screen/register_screen.dart';

import 'login_screen.dart';

class HomeSplashScreen extends StatefulWidget {
  @override
  HomeSplashScreenState createState() {
    return new HomeSplashScreenState();
  }
}

class HomeSplashScreenState extends State<HomeSplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: Center(
                child: Text(
                  'Mạng SV',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: MediaQuery.of(context).size.height / 4),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          color: Colors.blue,
                          child: Text(
                            'Đăng nhập'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        title: 'Đăng nhập',
                                      )),
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        height: 40.0,
                        margin: EdgeInsets.only(top: 15.0),
                        child: FlatButton(
                          color: Colors.white,
                          child: Text(
                            'Đăng ký'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen(
                                        title: 'Register',
                                      )),
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 4 - 145),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              child: Text('VN'),
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: Text('EN'),
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: Text('L'),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
