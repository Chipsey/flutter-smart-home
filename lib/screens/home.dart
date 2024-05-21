// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g_house/components/customa-app-bar.dart';
import 'package:g_house/objects/device.object.dart';
import 'package:g_house/objects/product.object.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:g_house/screens/detailed-room.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Product> products = [
    Product(
      name: 'Living Room',
      imageUrl: 'assets/images/living-room.jpeg',
      devices: [
        Device(
          name: 'Smart Light',
          icon: Icons.lightbulb_outline,
          switchURL: 'http://192.168.1.2/switch1',
        ),
        Device(
          name: 'Smart TV',
          icon: Icons.tv,
          switchURL: 'http://192.168.1.2/switch2',
        ),
        Device(
          name: 'Thermostat',
          icon: Icons.thermostat_outlined,
          switchURL: 'http://192.168.1.2/switch3',
        ),
        Device(
          name: 'Smart Speaker',
          icon: Icons.speaker,
          switchURL: 'http://192.168.1.4/switch3',
        ),
      ],
    ),
    Product(
      name: 'Bedroom',
      imageUrl: 'assets/images/bedroom.jpg',
      devices: [
        Device(
          name: 'Smart Light',
          icon: Icons.lightbulb_outline,
          switchURL: 'http://192.168.1.3/switch1',
        ),
        Device(
          name: 'Smart Fan',
          icon: Icons.wind_power_outlined,
          switchURL: 'http://192.168.1.3/switch2',
        ),
        Device(
          name: 'Air Purifier',
          icon: Icons.air,
          switchURL: 'http://192.168.1.3/switch3',
        ),
      ],
    ),
    Product(
      name: "Josh's Room",
      imageUrl: 'assets/images/josh.jpeg',
      devices: [
        Device(
          name: 'Smart Light',
          icon: Icons.lightbulb_outline,
          switchURL: 'http://192.168.1.4/switch1',
        ),
        Device(
          name: 'Gaming Console',
          icon: Icons.videogame_asset,
          switchURL: 'http://192.168.1.4/switch2',
        ),
        Device(
          name: 'Smart Speaker',
          icon: Icons.speaker,
          switchURL: 'http://192.168.1.4/switch3',
        ),
      ],
    ),
    Product(
      name: 'Kitchen',
      imageUrl: 'assets/images/kitchen.jpeg',
      devices: [
        Device(
          name: 'Smart Light',
          icon: Icons.lightbulb_outline,
          switchURL: 'http://192.168.1.5/switch1',
        ),
        Device(
          name: 'Smart Oven',
          icon: Icons.kitchen,
          switchURL: 'http://192.168.1.5/switch2',
        ),
        Device(
          name: 'Coffee Maker',
          icon: Icons.local_cafe,
          switchURL: 'http://192.168.1.5/switch3',
        ),
      ],
    ),
    Product(
      name: 'Garage',
      imageUrl: 'assets/images/garage.jpeg',
      devices: [
        Device(
          name: 'Smart Light',
          icon: Icons.lightbulb_outline,
          switchURL: 'http://192.168.1.6/switch1',
        ),
        Device(
          name: 'Garage Door',
          icon: Icons.garage,
          switchURL: 'http://192.168.1.6/switch2',
        ),
        Device(
          name: 'Security Camera',
          icon: Icons.security,
          switchURL: 'http://192.168.1.6/switch3',
        ),
      ],
    ),
  ];

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
          CustomAppBar(),
          ///////////////////// Body /////////////////////
          Expanded(
            //////////////////// Scrollable Content /////////////////////
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: sizePrimary * 2,
                  horizontal: sizePrimary,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Text(
                          "Registered Rooms",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: sizePrimary,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, index) {
                          return ItemCard(
                            product: products[index],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailedRoom(product: products[index]),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: sizePrimary * 3, right: sizePrimary, top: sizePrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: sizePrimary * 3,
                  height: sizePrimary * 3,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: baseColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: sizePrimary / 2),
                      child: NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: 0,
                          lightSource: LightSource.bottomRight,
                          color: baseColor,
                          surfaceIntensity: 0.5,
                        ),
                        child: Icon(
                          Icons.add,
                          size: sizePrimary,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function() press;
  const ItemCard({super.key, required this.product, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Hero(
            tag: product.imageUrl,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 20,
                  offset: Offset(5, 5),
                ),
              ], borderRadius: BorderRadius.all(Radius.circular(20))),
              width: 180,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
