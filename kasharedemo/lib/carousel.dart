import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kasharedemo/credit_card.dart';

const Color inactiveColor = Color(0x92FFFFFF);

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        carouselSlider = CarouselSlider(
          options: CarouselOptions(
            height: 500.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: true,
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
          ),
          items: imgList.map((imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/first');
                    },
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imgList, (index, url) {
            return Container(
              width: 10.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.white : inactiveColor,
              ),
            );
          }),
        ),
      ],
    );
  }
}
