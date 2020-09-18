import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.0),
            padding: EdgeInsets.all(20),
            child: Text(
              "Let's start with Login!",
              style: TextStyle(
                fontSize: 36.0,
                color: Color(0xFF6C63FF),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            child: SvgPicture.asset(
              'assets/google.svg',
              height: 100,
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: MyCustomForm(),
          )
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          _buildTextField(
            icon: Icons.account_circle,
            hintText: "Email or Phone",
          ),
          _buildTextField(
            icon: Icons.lock_outline,
            hintText: "Password",
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  color: Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            "or",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF6E8DE4),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/google.svg',
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Register Now",
                  style: TextStyle(
                      color: Color(0xFF6C63FF), fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
          // Add TextFormFields and RaisedButton here.
        ]));
  }

  Widget _buildTextField({String hintText, IconData icon}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 7,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          // padding: EdgeInsets.only(left: 15),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                prefixIcon: Icon(icon)),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
          ),
        ),
      ),
    );
  }
}
