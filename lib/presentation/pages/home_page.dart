
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child:InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("email :${FirebaseAuth.instance.currentUser!.email}"),
                SizedBox(height: 10,),
                Container(
                  width: 120,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("Logout", style: TextStyle(fontSize: 15, color: Colors.white),) ,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
