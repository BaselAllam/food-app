import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(15.0),
                    height: 100.0,
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://pbs.twimg.com/profile_images/1270783622434435072/nUAehm4__400x400.jpg'),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text(
                    'Bassel Allam',
                    style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)
                  )
                ],
              ),
            ),
            item('baseljahen@gmail.com', Icons.email),
            item('****', Icons.lock),
            item('15 - july - 1970', Icons.calendar_today),
            item('Sign out', Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
  item(String title, IconData leading){
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        leading: Icon(leading, color: Colors.black, size: 20.0),
        title: Text(
          '$title',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
        ),
        trailing: Icon(Icons.edit, color: Colors.grey, size: 20.0),
      ),
    );
  }
}