import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool result = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Search",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF819272),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buildSearchField('Search Product'),
                ],
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    result ? "No Search Result" : "Latest Search",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF10151A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                result
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 280,
                          child: Text(
                            "We currently dont have what you’re looking for.  Why not try out similar products",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF10151A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.width / 3,
                        // flex: 1,
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.access_time_outlined),
                                    title: Text("Recent search"),
                                    trailing: Icon(Icons.close),
                                    contentPadding: EdgeInsets.only(left: 0),
                                  ),
                                  Divider(
                                    color: Color(0xFFF5F5F5),
                                    // color: Colors.grey,
                                    thickness: 1,
                                    height: 0,
                                  )
                                ],
                              );
                            }),
                      ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                result ? "Related Searches" : "Popular Searches",
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF10151A),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Related Searches",
            //     style: TextStyle(
            //       fontSize: 17,
            //       color: Color(0xFF10151A),
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
            Expanded(
              // flex: 5,
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetailsScreen(
                              imageUrl: "assets/fruitbasket.png",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Hero(
                                  tag: "assets/fruitbasket.png",
                                  child: Container(
                                    width: 90,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/fruitbasket.png",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 120,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 250,
                                        child: Text(
                                          "Herbsconnect Organic Acai Berry Powder Freeze Dried",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
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
                                          color: Color(0xFF819272),
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
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Divider(
                              color: Color(0xFFF5F5F5),
                              // color: Colors.grey,
                              thickness: 1,
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// class searchWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "Latest Search",
//             style: TextStyle(
//               fontSize: 17,
//               color: Color(0xFF10151A),
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//         Container(
//           height: MediaQuery.of(context).size.width / 3,
//           // flex: 1,
//           child: ListView.builder(
//               itemCount: 2,
//               itemBuilder: (context, index) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.access_time_outlined),
//                       title: Text("Recent search"),
//                       trailing: Icon(Icons.close),
//                       contentPadding: EdgeInsets.only(left: 0),
//                     ),
//                     Divider(
//                       color: Color(0xFFF5F5F5),
//                       // color: Colors.grey,
//                       thickness: 1,
//                       height: 0,
//                     )
//                   ],
//                 );
//               }),
//         ),
//         SizedBox(
//           height: 32,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "Popular Searches",
//             style: TextStyle(
//               fontSize: 17,
//               color: Color(0xFF10151A),
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//         Expanded(
//           // flex: 5,
//           child: ListView.builder(
//               itemCount: 6,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => DetailsScreen(
//                           imageUrl: "assets/fruitbasket.png",
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.only(bottom: 16, top: 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Hero(
//                               tag: "assets/fruitbasket.png",
//                               child: Container(
//                                 width: 90,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                       "assets/fruitbasket.png",
//                                     ),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               height: 120,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container(
//                                     width: 250,
//                                     child: Text(
//                                       "Herbsconnect Organic Acai Berry Powder Freeze Dried",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     "Emmanuel Produce",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w400,
//                                       letterSpacing: 1.2,
//                                       color: Color(0xFF819272),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "N35,000.00",
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700,
//                                           letterSpacing: 1.2,
//                                           color: Color(0xFFF39E28),
//                                         ),
//                                       ),
//                                       Text(
//                                         "・",
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700,
//                                           color: Color(0xFFF3A953C),
//                                         ),
//                                       ),
//                                       Text(
//                                         "In stock",
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400,
//                                           color: Color(0xFFF3A953C),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 28,
//                         ),
//                         Divider(
//                           color: Color(0xFFF5F5F5),
//                           // color: Colors.grey,
//                           thickness: 1,
//                           height: 0,
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }
