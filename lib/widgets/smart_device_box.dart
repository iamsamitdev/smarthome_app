// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {

  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final Function(bool)? onChange;
  
  // Constructor
  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.green[900] : Colors.grey[600],
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: Colors.white,
              ),
              // Device name and power switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Switch(
                      value: powerOn, 
                      onChanged: onChange
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}