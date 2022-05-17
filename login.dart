import 'package:dady/SignUp.dart';
import 'package:dady/ViewList.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';


class login extends StatefulWidget{
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var n1 =new TextEditingController();
  var n2 =new TextEditingController();
  String userid = "";


  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: n1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('UserName'),
              ),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: n2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Password'),
              ),

            ),
            SizedBox(height: 10,),
            SizedBox(height: 20,),

            MaterialButton(
                child: Text('Login',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: ()async{
                  AsyncSnapshot mydata = (await FirebaseFirestore.instance.collection("data").get()) as AsyncSnapshot;
                  String user =n1.text;
                  String pass =n2.text;
                  for(int i = 0 ; i < mydata.data.docs.length; i++)
                    {
                        if(mydata.data.docs[i]["UserName"].toString().contains(user) && mydata.data.docs[i]["Password"].toString().contains(pass));
                        userid = mydata.data.docs[i].id;
                    }

                }),

            SizedBox(height: 20,),
            MaterialButton(
                child: Text('Sign Up',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                }),
          ],
        ),
      ),
    ),);
  }
}
