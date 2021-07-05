import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {this.onPress,
      this.productName,
      this.productSubText,
      this.onFav,
      this.productPrice,
      this.img,
      this.productAvailability});

  final VoidCallback onPress;
  final VoidCallback onFav;
  final String productName;
  final String productSubText;
  final String productPrice;
  final bool productAvailability;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height: 70,
        margin: EdgeInsets.only(top: 0, bottom: 0, right: 0),
        // width: MediaQuery.of(context).size.width / 2 - 32,
        // color: Colors.blueAccent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 10,
              child: Container(
                // height: 120,
                width: MediaQuery.of(context).size.width / 2 - 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.2,
                          color: Color(0xFF819272),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        productSubText,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productPrice,
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
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF3A953C),
                            ),
                          ),
                          Text(
                            productAvailability ? "In stock" : "Sold out",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF3A953C),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  width: MediaQuery.of(context).size.width / 2 - 32,
                  height: MediaQuery.of(context).size.width / 2 - 32,
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: onFav,
                child: Container(
                    height: 15,
                    width: 13,
                    child: Image.asset(
                      "assets/whiteheart.png",
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
