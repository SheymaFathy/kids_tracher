import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ViewList.dart';

class SignUp extends StatelessWidget{
  var x1 = new TextEditingController();
  var x2 = new TextEditingController();
  var x3 = new TextEditingController();
  var x4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: x1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Full Name'),
              ),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: x2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Password'),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: x3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Phone'),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: x4,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('UserName'),
              ),
            ),
            SizedBox(height: 20,),

            MaterialButton(
                child: Text('Save',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: (){
                  String a =x1.text;
                  String b =x2.text;
                  String c =x3.text;
                  String d =x4.text;

                  FirebaseFirestore.instance.collection("data").add(<String,dynamic>{'Full Name':a, 'Password':b, 'Phone':c, 'UserName':d });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList()));
                }),
          ],
        ),
      ),
    ),);

  }
}
