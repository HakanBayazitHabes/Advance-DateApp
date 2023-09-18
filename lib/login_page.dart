import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Login Page'), backgroundColor: Colors.blue[900]),
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Hello, welcome back!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text('Login to continue'),
          TextField(
            decoration: InputDecoration(hintText: 'Username'),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Password'),
          ),
          TextButton(
            onPressed: () {
              print('Clicked');
            },
            child: Text('Forgot Password?'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
          ),
          Text('Or sign in with'),
          ElevatedButton(
            onPressed: () {
              print('Google is clicked');
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 22,
                  height: 22,
                ),
                Text('Login with Google'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/images/facebook.png',
                  width: 22,
                  height: 22,
                ),
                Text('Login with Facebook'),
              ],
            ),
          ),
          Row(
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {},
                child: Text('Sign Up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
