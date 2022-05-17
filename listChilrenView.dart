import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'addChild.dart';

class ViewList extends StatefulWidget{
  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  double lat=30.044420, long = 31.235712;
  late String ChildName = "";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: getContent(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>addChild()));},
        child: Icon(Icons.add_circle, color: Colors.cyan),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list,size: 30,), label: 'Children List'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined,size: 30,), label: 'Current Location',),
        ],
        currentIndex: currentIndex,
        selectedItemColor:  Colors.cyan,
        unselectedItemColor: Colors.grey,
        onTap: _changeItem,

      ),


    ),
    );
  }

  Widget getContent(doc)
  {

    if(currentIndex == 1)
      {
        return GoogleMap(
          initialCameraPosition:CameraPosition(
              target:LatLng(lat,long),
              zoom: 10
          ),
          markers: {
            Marker(
              markerId: MarkerId(''),
              position: LatLng(lat,long),
              infoWindow: InfoWindow(
                snippet: 'hello',
              ),
            ),
          },
        );
      }
    else
    {
      return
        FutureBuilder(
            future: FirebaseFirestore.instance.collection('data').doc(
                'SwItRQRfjIqo78L2oF3N').collection("child").get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false)
                return Text('No Internet Connection');
              else
              {
                return ListView.builder(itemCount:  snapshot.data.docs.length,
                    itemBuilder:(context, index){
                      return getContent(snapshot.data.docs[index][ChildName],);
                    }
                );
              }
            }
        );

    }
  }

  void _changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

}


