import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dady/ViewList.dart';
import 'package:dady/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class addChild extends StatelessWidget{
  var c1 = new TextEditingController();
  var c2 = new TextEditingController();
  var c3 = new TextEditingController();
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
              controller: c1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Child Name'),
              ),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: c2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Password'),
              ),
            ),
        SizedBox(height: 10,),
        TextField(
          controller: c3,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            label: Text('User Name'),
          ),
        ),
            SizedBox(height: 20,),

            MaterialButton(
                child: Text('Save',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: (){
                  String x= c1.text;
                  String y= c2.text;
                  String z= c3.text;

                  FirebaseFirestore.instance.collection("data").doc(
                    'SwItRQRfjIqo78L2oF3N').collection("child").add(<String,dynamic>{
                    'Child Name':x, 'Password':y, 'User Name':z,
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList()));
                }),
          ],
        ),
      ),
    ),
    );
  }
}
