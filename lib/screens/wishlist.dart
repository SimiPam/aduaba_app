import 'package:flutter/material.dart';

import 'empty_wishlist.dart';

class MyWishList extends StatefulWidget {
  const MyWishList({Key key}) : super(key: key);

  @override
  _MyWishListState createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFF424347),
                size: 35,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "My Wishlist",
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF819272),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "18 items selected",
              style: TextStyle(
                  color: Color(0xFFBBBBBB),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ListTile(
                      //   leading:
                      Container(
                        width: 78,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/image.png",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 16, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 105,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 250,
                                    child: Text(
                                      "Herbsconnect Organic Acai Berry Powder Freeze Dried",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Emmanuel Produce",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.2,
                                      color: Color(0xFFBBBBBB),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "N35,000.00",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.2,
                                          color: Color(0xFFF39E28),
                                        ),
                                      ),
                                      Text(
                                        "・",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFF3A953C),
                                        ),
                                      ),
                                      Text(
                                        "In stock",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFF3A953C),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EmptyWishlist(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 20,
                          height: 30,
                          child: Image.asset('assets/trash.png'),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xFFF5F5F5),
                    // color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ]));
  }
}
