// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:g_house/objects/device.object.dart';
import 'package:g_house/objects/product.object.dart';

class DetailedRoom extends StatefulWidget {
  final Product product;
  const DetailedRoom({super.key, required this.product});

  @override
  State<DetailedRoom> createState() => _DetailedRoomState();
}

class _DetailedRoomState extends State<DetailedRoom> {
  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final sizePrimary = size.shortestSide / 20;
    final baseColor = Color.fromARGB(255, 236, 240, 243);

    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////// App Bar /////////////////////
          SizedBox(
            height: sizePrimary * 4,
          ),
          ///////////////////// Body /////////////////////
          Expanded(
            //////////////////// Scrollable Content /////////////////////
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(sizePrimary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.product.imageUrl,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        width: size.shortestSide,
                        height: size.shortestSide / 1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(widget.product.imageUrl,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizePrimary,
                    ),
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: sizePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${widget.product.devices.length} Devices Found",
                      style: TextStyle(
                        fontSize: sizePrimary / 2,
                      ),
                    ),
                    GridView.builder(
                      itemCount: widget.product.devices.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: sizePrimary,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return DeviceCard(
                          device: widget.product.devices[index],
                          sizePrimary: sizePrimary * 4,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceCard extends StatefulWidget {
  final Device device;
  final double sizePrimary;
  const DeviceCard(
      {super.key, required this.device, required this.sizePrimary});

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    const baseColor = Color.fromARGB(255, 236, 240, 243);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            lightSource: LightSource.topLeft,
            color: baseColor,
            depth: 4,
            surfaceIntensity: 0.2,
            intensity: 0.5,
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.sizePrimary / 5),
            child: Stack(
              children: [
                Container(
                  width: widget.sizePrimary,
                  height: widget.sizePrimary,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.device.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: widget.sizePrimary / 7,
                          color: Colors.grey[800]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: widget.sizePrimary / 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          widget.device.icon,
                          size: widget.sizePrimary / 3,
                          color: Colors.grey[800],
                        ),
                        NeumorphicSwitch(
                          value: _switchValue,
                          height: widget.sizePrimary / 4,
                          style: NeumorphicSwitchStyle(
                            inactiveTrackColor: baseColor,
                            inactiveThumbColor: baseColor,
                            thumbDepth: 0,
                            activeTrackColor: Colors.green,
                            thumbShape: NeumorphicShape.convex,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
