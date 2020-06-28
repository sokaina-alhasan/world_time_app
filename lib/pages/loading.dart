import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


//.............................................
class _LoadingState extends State<Loading> {

  void setupTime()async{
    WorldTime instance=WorldTime(location: 'Riyadh',flag: 'saudi.png',url: 'Asia/Riyadh');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'time':     instance.time,
      'flag':     instance.flag,
      'isDay':    instance.isDay,
    });
  }
  @override
  void initState() {
    super.initState();
    setupTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wallpaper.png'),
          fit: BoxFit.cover,
        ),
        ),
        child: Center(
          child: SpinKitCubeGrid(
            color: Colors.amber[900],
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
