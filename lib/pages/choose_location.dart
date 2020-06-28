import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'saudi.png'),
  WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index)async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,
    {
      'location': instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDay':instance.isDay,
    }
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location '),
        centerTitle: true,
        elevation:0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location,
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                ),),
                leading: CircleAvatar(
                  backgroundImage:  AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
