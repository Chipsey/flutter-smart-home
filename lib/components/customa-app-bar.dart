// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final sizePrimary = size.shortestSide / 20;

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: sizePrimary * 4,
          left: sizePrimary,
          right: sizePrimary,
          bottom: sizePrimary,
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Again,'),
                Text(
                  'Josh.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: sizePrimary * 2,
                    height: sizePrimary * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
