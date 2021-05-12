import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'package:planets_app/Constants.dart';
import 'package:planets_app/Details_page.dart';
import 'package:planets_app/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7]),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Solar System',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: const Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                    onChanged: (dynamic value) {},
                    icon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('Assets/drop_down_icon.png'),
                    ),
                    underline: SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 17,
                      space: 5,
                      // size: 20,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) =>
                                    DetailsPage(planetInfo: planets[index])));
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        planets[index].name!,
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 44,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Solar System',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 24,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Know More',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(Icons.arrow_forward,
                                              color: secondaryTextColor),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(planets[index].iconImage),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        // color: navigationColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(118),
            topRight: Radius.circular(118),
          ),
          color: navigationColor,
        ),
        child: Container(
          //
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('Assets/menu_icon.png')),

                IconButton(
                    onPressed: () {},
                    icon: Image.asset('Assets/search_icon.png')),

                IconButton(
                    onPressed: () {},
                    icon: Image.asset('Assets/profile_icon.png')),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
