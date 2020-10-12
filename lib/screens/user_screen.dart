import 'package:accidentv/screens/login_screen.dart';
import 'package:accidentv/widgets/sign_in.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl,
            ),
            radius: 60,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: 40),
          Text(
            'NAME',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'EMAIL',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Text(
            email,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Center(
            child: RaisedButton(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }), ModalRoute.withName('/'));
              },
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
          ),
        ],
      ),
    );
  }
}
