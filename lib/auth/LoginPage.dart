import 'package:flutter/material.dart';
import 'package:latkuis_011/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafef3f3),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _flutterLogo(),
                SizedBox(height: 20),
                _titleText(),
                SizedBox(height: 10),
                _descText(),
                SizedBox(height: 20),
                _usernameField(),
                _passwordField(),
                SizedBox(height: 20),
                _loginButton(context),
                ],
              )),
        ),
      ),
    );
  }

  Widget _flutterLogo() {
    return Image.asset(
      'assets/icons/logo.png',
      height: 100,
    );
  }
  

  Widget _titleText() {
    return Text(
      'LOGIN',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _descText() {
    return Text(
      'Mau Order Makan? Login dulu kuyy',
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: "Username",
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: "Password",
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: Size(double.infinity, 50),
          ),
          onPressed: () {
            setState(() {
              if (username == "fulan" && password == "fulan") {
                isLoginSuccess = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Login Berhasil"),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome(username: username)),
                );
              } else {
                isLoginSuccess = false;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Login Gagal"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            });
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          ),
    );
  }
}
