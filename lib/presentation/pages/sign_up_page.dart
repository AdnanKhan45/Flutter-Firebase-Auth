import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onTapClickListener;

  const SignUpPage({Key? key, required this.onTapClickListener}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool? _isSigning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Email"),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Password"),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: InkWell(
              onTap: () {
                _signUpUser();
              },
              child: Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _isSigning == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please wait..."),
                    SizedBox(
                      width: 10,
                    ),
                    CircularProgressIndicator()
                  ],
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: widget.onTapClickListener,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  Future _signUpUser() async {
    setState(() {
      _isSigning = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ).then((value) {
        setState(() {
          _isSigning = false;
        });
      });
    } catch (e) {
      print("error occured $e");
    }
  }

// Future _signInUser() async {
//   setState(() {
//     _isSigning = true;
//   });
//   try {
//     await FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//       email: _emailController.text,
//       password: _passwordController.text,
//     )
//         .then((value) {
//       setState(() {
//         _isSigning = false;
//       });
//     });
//   } catch (e) {
//     print("some error $e");
//   }
// }
}
