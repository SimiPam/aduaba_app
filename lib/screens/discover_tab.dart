import 'package:aduaba_app/model/category.dart';
import 'package:aduaba_app/providers/category_provider.dart';
import 'package:aduaba_app/providers/product_provider.dart';
import 'package:aduaba_app/screens/search_screen.dart';
import 'package:aduaba_app/widgets/custom_page_route.dart';
import 'package:aduaba_app/widgets/product_widget.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../utilities/constants.dart';
import 'category_screen.dart';
import 'details_screen.dart';

class DiscoverTab extends StatelessWidget {
  final VoidCallback openDraw;
  DiscoverTab({Key key, this.openDraw}) : super(key: key);

  List<Category> _categoryList = [];
  var api;

  Widget _buildCategoryList(int index, context) {
    final color = Colors.white;
    return GestureDetector(
      onTap: () {
        // api = Provider.of<CategoryProductModel>(context, listen: false)
        //     .fetchProductsFromCategory(_categoryList[index].categoryName);
        Navigator.push(
          context,
          CustomPageRoute(
            child: CategoryScreen(
              categoryName: _categoryList[index].categoryName,
            ),
          ),
        );
      },
      child: Container(
        // height: 60,
        // width: 60,

        // padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 16, top: 35),

        alignment: Alignment.center,
        child: _categoryList.isNotEmpty
            ? Text(
                _categoryList[index].categoryName,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                  fontWeight: FontWeight.w400,
                ),
              )
            : Text(
                "",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                  fontWeight: FontWeight.w400,
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: Builder(
        builder: (context) {
          final model = Provider.of<ProductModel>(context);
          // if (model.homeState == HomeState.Loading) {
          //   return Center(child: CircularProgressIndicator());
          // }
          // if (model.homeState == HomeState.Error) {
          //   return Center(child: Text('An Error Occured ${model.message}'));
          // }
          final products = model.products;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    child: Icon(Icons.menu_outlined),
                                    onTap: openDraw,
                                  );
                                },
                              ),
                              SizedBox(
                                width: 28,
                              ),
                              Text(
                                "Discover",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF819272),
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SearchScreen()));
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFFBABABA),
                                  size: 35,
                                ),
                              ),
                              SizedBox(
                                width: 28,
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xFF3A953C),
                                child: Image.asset("assets/homecart.png"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ChangeNotifierProvider(
                          create: (context) => CategoryModel(),
                          child: Builder(builder: (context) {
                            final catModel =
                                Provider.of<CategoryModel>(context);
                            _categoryList = catModel.categoryList;
                            return _categoryList.isEmpty
                                ? Container()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _categoryList
                                        .asMap()
                                        .entries
                                        .map(
                                          (MapEntry map) => _buildCategoryList(
                                              map.key, context),
                                        )
                                        .toList(),
                                  );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: model.homeState == HomeState.Error
                      ? Center(child: Text('No Products Available'))
                      : model.homeState == HomeState.Loading
                          ? Center(child: CircularProgressIndicator())
                          : StaggeredGridView.countBuilder(
                              crossAxisCount: 4,
                              itemCount: products.length,
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.count(2, 3),
                              mainAxisSpacing: 28.0,
                              crossAxisSpacing: 16.0,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return OpenContainer(
                                  closedElevation: 0,
                                  openElevation: 0,
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  transitionType: detailsPageTransitionType,
                                  openBuilder: (context, _) => DetailsScreen(
                                    imageUrl: product.imageUrl,
                                  ),
                                  closedBuilder:
                                      (context, VoidCallback openContainer) =>
                                          ProductWidget(
                                    onPress: openContainer,
                                    productName: product.name,
                                    productSubText: product.description,
                                    productPrice: product.unitPrice.toString(),
                                    img: product.imageUrl,
                                    productAvailability: product.isAvailable,
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// return GestureDetector(
// onTap: () {},
// child: Container(
// // height: 400,
// color: Colors.red,
// child: Column(
// children: [
// Stack(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(5),
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(5),
// child: Image(
// width: MediaQuery.of(context).size.width / 2 -
// 32,
// height:
// MediaQuery.of(context).size.width / 2 -
// 32,
// image: AssetImage("assets/fruitbasket.png"),
// fit: BoxFit.fill,
// ),
// ),
// ),
// Positioned(
// top: 10,
// right: 10,
// child: Image.asset("assets/whiteheart.png"),
// ),
// ],
// ),
// Container(
// // height: 120,
// width: MediaQuery.of(context).size.width / 2 - 32,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(4),
// ),
// child: Padding(
// padding: EdgeInsets.all(10.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Text(
// "Emmanuel Produce",
// style: TextStyle(
// fontSize: 10,
// fontWeight: FontWeight.w300,
// letterSpacing: 1.2,
// color: Color(0xFF819272),
// ),
// ),
// SizedBox(
// height: 4,
// ),
// Text(
// "Herbsconnect Organic Acai Berry Powder Freeze Dried",
// style: TextStyle(
// fontSize: 13,
// fontWeight: FontWeight.w500,
// ),
// ),
// SizedBox(
// height: 8,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "N35,000.00",
// style: TextStyle(
// fontSize: 13,
// fontWeight: FontWeight.w700,
// letterSpacing: 1.2,
// color: Color(0xFFF39E28),
// ),
// ),
// Text(
// "・",
// style: TextStyle(
// fontSize: 13,
// fontWeight: FontWeight.w400,
// color: Color(0xFFF3A953C),
// ),
// ),
// Text(
// "In stock",
// style: TextStyle(
// fontSize: 13,
// fontWeight: FontWeight.w400,
// color: Color(0xFFF3A953C),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// );

// GridView.builder(
// itemCount: 4,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 24,
// crossAxisSpacing: 16,
// ),
