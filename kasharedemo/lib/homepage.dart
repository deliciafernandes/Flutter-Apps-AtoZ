import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasharedemo/carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.monetization_on),
                      Text(
                        ' Design Bitcoin',
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Icon(
                    Icons.menu,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Credit Card',
            style: Theme.of(context).textTheme.subtitle,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Icon(
                  Icons.credit_card,
                  color: Color(0xFFE8449B),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'OnePay',
                  style: Theme.of(context).textTheme.body1,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Invest in your',
                  style: Theme.of(context).textTheme.body2,
                ),
                Text(
                  'future',
                  style: Theme.of(context).textTheme.body2,
                )
              ],
            ),
          ),
          Expanded(
            child: CarouselDemo(),
          ),
        ],
      ),
    );
  }
}

//Transform.rotate(
//angle: pi / 4,
//child: CarouselDemo(),
//),
