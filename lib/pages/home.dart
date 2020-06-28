import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
      data=data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
      String bg= data['isDay'] ? 'day.jpg':'night.jpg';
      Color bgColor=data['isDay'] ? Colors.blue[300]: Colors.blue[900];
      print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bg'),
            fit: BoxFit.cover,
          ),
        ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 250.0, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                  dynamic result=await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'isDay':result['isDay'],
                      'location':result['location'],
                      'flag':result['flag'],
                    };
                  });
                },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                      ),
                    label: Text(
                      'Edit Location'
                    ,style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 18.0,
                        letterSpacing: 2.0,

                      ),),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${data['flag']}'),
                    ),
                    SizedBox(width: 15.0,),
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
