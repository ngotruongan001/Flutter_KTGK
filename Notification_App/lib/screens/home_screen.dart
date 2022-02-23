import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/screens/member_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://scontent.fdad3-4.fna.fbcdn.net/v/t1.6435-9/125207208_772934269953977_4490082632494627622_n.jpg?stp=dst-jpg_p640x640&_nc_cat=107&ccb=1-5&_nc_sid=174925&_nc_ohc=vKHBjxavYGkAX-Bj0EA&tn=2p2qes42IQTpsD0J&_nc_ht=scontent.fdad3-4.fna&oh=00_AT82Kl3YFYh10SHJZNgYgaiMxKdNIMnuBXHqDynJU4Zm5Q&oe=62366C3D",
      "https://scontent.fdad3-5.fna.fbcdn.net/v/t1.6435-9/176471984_1132384910598945_1582581093447261844_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_a4fRtPg7U8AX-LhuVY&_nc_ht=scontent.fdad3-5.fna&oh=00_AT9qXH7iNMvDqqfrdXr_s9DGMOlSCI5CVZnM2pjQgrf-6g&oe=6238ABEB",
      "https://scontent.fdad3-4.fna.fbcdn.net/v/t1.6435-9/147777520_1109676246138857_5260522334749528013_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=HnJJVtvmGwMAX9XWgUY&_nc_ht=scontent.fdad3-4.fna&oh=00_AT-4IqPeC3oOl2dy-cPzEgpYcWxjw_qJJWyuLBKRcdOCGA&oe=6235FD69",
      "https://scontent.fdad3-4.fna.fbcdn.net/v/t1.6435-1/s320x320/197254358_1679903682397726_8837667642675912906_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=VMkW7PdwP7QAX9HXWSK&_nc_ht=scontent.fdad3-4.fna&oh=00_AT8MQWjwLlzIvMyU_Yf_fkBBjLezMGS9MJal2_iCBtjFng&oe=62393DE3",
      "https://scontent.fdad3-5.fna.fbcdn.net/v/t39.30808-6/242062678_1188699691655411_911915045520909193_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=eHukygv8HA4AX8aCMhZ&_nc_ht=scontent.fdad3-5.fna&oh=00_AT_zri46AEElJQfc8OV20m6fpX9-zIf-TFuyhfQ5EvRHFA&oe=621617B4",
      "https://sieupet.com/sites/default/files/bf3980a9268de0b501ed9895d860ada7.jpg",
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,title: const Text('Trang chu',style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],),
      body: ListView(
          children: <Widget>[
            // Column(
            //   children: <Widget>[
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         FlatButton(
            //           child: Image.asset('assets/images/menu.png'),
            //           onPressed: () {},
            //         ),
            //         FlatButton(
            //           child: Image.asset('assets/images/bell.png'),
            //           onPressed: () {},
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 30),
            //   child: Text(
            //     'Trang chủ',
            //     style: TextStyle(
            //         fontSize: 35,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
            const SizedBox(
              height: 30.0,
            ),
            CarouselSlider(
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                e,
                                width: 1050,
                                height: 350,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                )),
            const SizedBox(
              height: 30,
            ),
               Container(
                margin: const EdgeInsets.only(left: 30),
                child: const Text(
                  'Thành Viên',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberScreen()));
              },
              child: Container(
                height: 150,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    'assets/images/tinh.jpg',
                                    fit: BoxFit.fill,
                                    height: 180.0,
                                    width: 170.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberScreen()));
              },
              child: Container(
                height: 150,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    'assets/images/an.jpg',
                                    fit: BoxFit.fill,
                                    height: 180.0,
                                    width: 170.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberScreen()));
              },
              child: Container(
                height: 150,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    'assets/images/hoang.jpg',
                                    fit: BoxFit.fill,
                                    height: 180.0,
                                    width: 170.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberScreen()));
              },
              child: Container(
                height: 150,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    'assets/images/long.jpg',
                                    fit: BoxFit.fill,
                                    height: 180.0,
                                    width: 170.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberScreen()));
              },
              child: Container(
                height: 150,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    'assets/images/bac.jpg',
                                    fit: BoxFit.fill,
                                    height: 180.0,
                                    width: 170.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberScreen()));
              },
              child: Container(
                height: 150,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    'assets/images/an.jpg',
                                    fit: BoxFit.fill,
                                    height: 180.0,
                                    width: 170.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
