import 'package:flutter/material.dart';
import 'package:flutter_app/Login/login_potrait.dart';
import 'package:flutter_app/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignPortait extends StatefulWidget {
  @override
  _SignPortaitState createState() => _SignPortaitState();
}

class _SignPortaitState extends State<SignPortait> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, password, username, value, _confirmPass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    Future _showToastMsg(String msgType, String msg) {
      if (msgType == "success") {
        return Fluttertoast.showToast(
          msg: msg,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
        );
      } else if (msgType == "error") {
        return Fluttertoast.showToast(
          msg: msg,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
        );
      } else {
        return Fluttertoast.showToast(
          msg: msg,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
        );
      }
    }

    var height = MediaQuery.of(context).size.height;
    //width of the screen
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primaryColor,
        body: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: ScrollConfiguration(
            behavior: ScrollBehavior()
              ..buildViewportChrome(context, null, AxisDirection.down),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
                            child: Text(
                              'Thiwana',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 35,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 90, 0, 0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: ' Game ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontFamily: 'Mont',
                                  fontWeight: FontWeight.w300,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Client',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.2,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Color(0xFF16181A),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text('SignUp',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 50)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: new Container(
                                  width: width * 0.8,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0X2eCBCBCB),
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: new TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      username =
                                          value; //get the value entered by user.
                                    },
                                    validator: (input) {
                                      if (input == null || input.isEmpty) {
                                        return "Enter Username";
                                      }
                                    },
                                    decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: 'Username',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: new Container(
                                  width: width * 0.8,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0X2eCBCBCB),
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: new TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      email =
                                          value; //get the value entered by user.
                                    },
                                    validator: validateEmail,
                                    decoration: new InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: new Container(
                                  width: width * 0.8,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0X2eCBCBCB),
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: new TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      password =
                                          value; //get the value entered by user.
                                    },
                                    validator: (input) {
                                      if (input == null || input.isEmpty) {
                                      } else if (input.length < 7) {
                                        return "Password must be greater than 7 characters";
                                      }
                                    },
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: new Container(
                                  width: width * 0.8,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0X2eCBCBCB),
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: new TextFormField(
                                    onChanged: (value) {
                                      _confirmPass =
                                          value; //get the value entered by user.
                                    },
                                    validator: (val) {
                                      if (val.isEmpty) return ' Empty';
                                      if (val != password) return 'Not Match';
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                      hintText: 'Re-Type Password',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: RaisedButton(
                                      color: buttonColor,
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          void submit() {
                                            setState(() {
                                              showProgress = true;
                                            });
                                          }

                                          try {
                                            final newUser = await auth
                                                .createUserWithEmailAndPassword(
                                                    email: email,
                                                    password: password);
                                            if (newUser != null) {
                                              FirebaseFirestore.instance
                                                  .collection("user")
                                                  .doc("$email")
                                                  .set({
                                                'created_at': Timestamp.now(),
                                                'person_name': username,
                                                'email': email,
                                                'person_phone_no':
                                                    "ShopDetail.shopData.phone",
                                                'position':
                                                    "ShopDetail.shopData.position",
                                                'status': -1,
                                              });
                                              new Future.delayed(
                                                  new Duration(seconds: 4), () {
                                                setState(() {
                                                  showProgress = false;
                                                });
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login(),
                                                  ));
                                            }
                                          } catch (e) {
                                            print(e);
                                            _showToastMsg("error",
                                                "Email Already Registered");
                                          }
                                        }

                                        //   Navigator.push(
                                        //     context,
                                        //   MaterialPageRoute(
                                        //   builder: (context) => Profile(),
                                        //));
                                      },
                                      child: Center(
                                        child: Text('Register',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Already a User ?',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 5.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Login(),
                                            ));
                                      },
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ]),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}

String validateEmail(String value) {
  print("validateEmail : $value ");

  if (value.isEmpty) return "enter email";

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regex = new RegExp(pattern);

  if (!regex.hasMatch(value.trim())) {
    return "the email address is not valid";
  }

  return null;
}
