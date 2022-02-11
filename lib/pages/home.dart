import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'day_sky.jpg' : 'night_sky.jpg';
    Color bgColor = data['isDaytime'] ? Colors.lightBlue : Colors.indigoAccent;

    return  Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage') ,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,150.0,0,0),
          child: Column(
            children: <Widget> [
               const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                data['date'],
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 30.0),
              TextButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  if(result != null){
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'date':result['date'],
                        'flag': result['flag']
                      };
                    });
                  }
                },

                icon: const Icon(Icons.edit_location, color: Colors.white),
                label: const Text('Change Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

