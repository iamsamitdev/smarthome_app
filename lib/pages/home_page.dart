// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarthome_app/widgets/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // list of smart devices
  List mySmartDevices = [
    ["Smart Light", "assets/icons/light-bulb.png", false],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false],
  ];

  // power switch handler
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40, 
                top: 25,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 32,
                    color: Colors.grey[800],
                  ),
                  // profile icon
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage('assets/icons/ajsamit.jpg'),
                    )
                  ),
                ]
              ),
            ),
            // Welcome home
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40, 
                vertical: 0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Home',
                            style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                          ),
                          Text(
                            'SMK House',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset('assets/icons/house.png', width: 120)
                    ],
                  ),
                ]
              ),
            ),

            // Smart devices title
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40, 
                vertical: 10
              ),
              child: Text(
                'Smart Devices',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Gridview
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0], 
                    iconPath: mySmartDevices[index][1], 
                    powerOn: mySmartDevices[index][2],
                    onChange: (value) => powerSwitchChanged(value, index)
                  );
                }
              )
            )

          ]
        ),
      ),
    );
  }
}