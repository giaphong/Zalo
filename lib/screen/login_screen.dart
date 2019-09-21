import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  LoginScreen({this.title});

  @override
  LoginScreenState createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final txtPhoneController = TextEditingController();
  final txtPasswordController = TextEditingController();

  Widget lblInfo() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white30,
      child: Center(
        child: Text('Vui lòng nhập số điện thoại và mật khẩu để đăng nhập'),
      ),
    );
  }

  Widget txtPhone() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: txtPhoneController,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Số điện thoại'),
      ),
    );
  }

  String statePassword = 'Ẩn';
  bool isPassword = true;

  Widget txtPassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: TextField(
              controller: txtPasswordController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Mật khẩu'),
            ),
          ),
          Container(
            width: 90,
            child: FlatButton(
              child: Text(statePassword),
              onPressed: () {
                setState(() {
                  statePassword == 'Hiện'
                      ? statePassword = 'Ẩn'
                      : statePassword = 'Hiện';
                  isPassword = !isPassword;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget btnLogin() {
    return Container(
      width: 200.0,
      child: Visibility(
        child: FlatButton(
          color: Colors.blue,
          child: Text('Đăng nhập'),
          onPressed: () {
            String phoneNumber = txtPhoneController.text;
            String password = txtPasswordController.text;
            if (phoneNumber.trim().isNotEmpty && password.trim().isNotEmpty) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                ModalRoute.withName('/')
              );

            } else {
              return null;
            }
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),

        ),
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: true,
      ),
    );
  }

  Widget txtGetPassword() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: new GestureDetector(
          child: Text('Lấy lại mật khẩu',
              style: TextStyle(fontSize: 15.0, color: Colors.blue)),
          onTap: () {},
        ));
  }

  Widget txtQuestionZalo() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 350),
      child: new GestureDetector(
        child: Text('Câu hỏi thường gặp'),
        onTap: () {},
      ),
    );
  }

  @override
  void dispose() {
    txtPhoneController.dispose();
    txtPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Đăng nhập',),
          titleSpacing: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              lblInfo(),
              txtPhone(),
              txtPassword(),
              btnLogin(),
              txtGetPassword(),
              txtQuestionZalo()
            ],
          ),
        ));
  }
}
