import 'dart:async';

import 'package:aduaba_app/model/product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String imageUrl;
  final Product product;

  const DetailsScreen({Key key, this.imageUrl, this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLiked = false;

  void toggleLike() {
    isLiked = !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      isLiked = true;
                    });
                  },
                  child: Image(
                    image: NetworkImage(widget.product.imageUrl),
                    // image: AssetImage("assets/fruitbasket.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 25,
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              toggleLike();
                            });
                          },
                          child: isLiked
                              ? Image.asset("assets/redheart.png")
                              // : Image.asset("assets/whiteheart.png"),
                              : Icon(
                                  Icons.favorite_border_outlined,
                                  size: 25,
                                  color: Color(0xFF10151A),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.product.vendorId,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2,
                        color: Color(0xFF819272),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 300,
                  child: Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.2,
                      color: Color(0xFF10151A),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      "MORE DETAILS",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                        color: Color(0xFF494846),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.add,
                      color: Color(0xFF494846),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 20,
              top: 10,
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.unitPrice.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: Color(0xFF000000),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                            // backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Added to cart!",
                                  style: TextStyle(
                                    color: Color(0xFF10151A),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ));
                      },
                    );
                    Timer(
                      const Duration(milliseconds: 300),
                      () => Navigator.pop(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3A953C),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 38),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  child: Text(
                    "Add To Cart",
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
